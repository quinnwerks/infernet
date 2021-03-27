#!python
# targeting 3.7.2
"""
Infernet GUI module.
Built on top of networking utilities.
"""
import logging
import glob
import time
from timeit import default_timer as timer

import os
import statistics
import numpy as np
import matplotlib as plt
import matplotlib.pyplot as pyplt
import matplotlib.ticker as mtick
from matplotlib.figure import Figure
from matplotlib.backends.backend_tkagg import (
    FigureCanvasTkAgg, NavigationToolbar2Tk)

import tkinter as tk
import tkinter.ttk as ttk
from PIL import Image as Pil_Image, ImageTk as Pil_ImageTk
import PIL.ImageOps as Pil_ImageOps
from tkinter_custom_button import TkinterCustomButton as TCB

import networking532 as n532
import client as cli

NN_INPUT_W = 28
NN_INPUT_H = 28

GUI_IMG_INPUT_W = 280
GUI_IMG_INPUT_H = 280

DX = -2
DY = -2

FONT_LABELS = ('calibre', 10, 'bold')
FONT_ENTRIES = ('calibre', 10, 'normal')


class Infernet_Statistics:
    """
    Manages the statistics for a single infernet inference batch.
    """

    def __init__(self):
        """
        Initialize the statistics class.
        """
        self.rtt_list = []
        self.mean_rtt_list = []
        self.correct_classifications = {"0": 0, "1": 0, "2": 0, "3": 0, "4": 0,
                                        "5": 0, "6": 0, "7": 0, "8": 0, "9": 0}
        self.incorrect_classifications = {"0": 0, "1": 0, "2": 0, "3": 0, "4": 0,
                                          "5": 0, "6": 0, "7": 0, "8": 0, "9": 0}

    def plot(self, figure):
        figure.clf()

        # Line graph for round trip time
        rtt_plot = figure.add_subplot(2, 1, 1)
        rtt_x = range(0, len(self.rtt_list))
        rtt_y = self.rtt_list

        rtt_y_mean = self.mean_rtt_list
        rtt_plot.plot(rtt_x, rtt_y, '-b', label="round trip time")
        rtt_plot.plot(rtt_x, rtt_y_mean, '--g', label="mean round trip time")

        rtt_plot.yaxis.set_major_formatter(mtick.FormatStrFormatter('%.1e'))
        rtt_plot.legend()

        max_rtt_x = max(rtt_x) + 1
        max_ticks_rtt_x = 8
        ticks_rtt_x = 1
        if max_rtt_x > max_ticks_rtt_x:
            ticks_rtt_x = max_rtt_x / max_ticks_rtt_x
        rtt_plot.xaxis.set_major_formatter(mtick.FormatStrFormatter('%d'))
        rtt_plot.xaxis.set_major_locator(mtick.MultipleLocator(ticks_rtt_x))
        rtt_plot.set_ylabel("Time (Seconds)")
        rtt_plot.set_xlabel("Inference #")
        rtt_plot.title.set_text("Round Trip Time")

        # Bar graph for correct classifications
        class_bar = figure.add_subplot(2, 1, 2)
        bar_x = np.arange(len(self.correct_classifications.keys()))
        class_bar.set_xticks(bar_x)
        class_bar.set_xticklabels(self.correct_classifications.keys())

        bar_y_correct = self.correct_classifications.values()
        bar_y_incorrect = self.incorrect_classifications.values()

        bar_width = 0.2
        class_bar.bar(bar_x - bar_width / 2, bar_y_correct, width=bar_width,
                      color='b', align='center', label="correct")
        class_bar.bar(bar_x + bar_width / 2, bar_y_incorrect, width=bar_width,
                      color='r', align='center', label="incorrect")

        # Set bar graph to integer labels only on y axis
        max_bar_y = max(max(bar_y_incorrect) + 1, max(bar_y_correct) + 1)
        ticks_bar_y = 1
        max_ticks_bar_y = 6
        if max_bar_y > max_ticks_bar_y:
            ticks_bar_y = max_bar_y / max_ticks_bar_y
        class_bar.yaxis.set_major_formatter(mtick.FormatStrFormatter('%d'))
        class_bar.yaxis.set_major_locator(mtick.MultipleLocator(ticks_bar_y))

        class_bar.title.set_text("Classification Accuracy")
        class_bar.legend()
        class_bar.set_ylabel("# Classifications")
        class_bar.set_xlabel("Digit")

        figure.tight_layout(pad=2.0)

    def update(self, new_rtt, label, correct):
        """
        Update the current statistics state.
        """
        self.rtt_list.append(new_rtt)
        self.mean_rtt_list.append(statistics.mean(self.rtt_list))
        if correct:
            self.correct_classifications[label] += 1
        else:
            self.incorrect_classifications[label] += 1

    def reset(self):
        """
        Reset the statistics for another inference batch.
        """
        self.rtt_list = []
        self.mean_rtt_list = []
        self.correct_classifications = {"0": 0, "1": 0, "2": 0, "3": 0, "4": 0,
                                        "5": 0, "6": 0, "7": 0, "8": 0, "9": 0}
        self.incorrect_classifications = {"0": 0, "1": 0, "2": 0, "3": 0, "4": 0,
                                          "5": 0, "6": 0, "7": 0, "8": 0, "9": 0}


def make_fixed_label(parent, x, y, h, w, *args, **kwargs) -> tk.Label:
    f = tk.Frame(parent, height=h, width=w)
    f.place(x=x, y=y)
    f.pack_propagate(0)  # don't shrink
    lbl = tk.Label(f, *args, **kwargs)
    lbl.pack(fill=tk.BOTH, expand=1)
    return lbl


class Dumb_Button(tk.Button):
    def __init__(self, parent, x, y, w, h, imgs: dict, action):
        super().__init__()
        self.imgs = {}
        for k, v in imgs.items():
            self.imgs[k] = Pil_ImageTk.PhotoImage(Pil_Image.open(v))

        self.canvas = tk.Canvas(parent, width=w, height=h)
        self.canvas.place(x=x, y=y)
        self.canvas.create_image(0, 0, anchor=tk.NW, image=self.imgs['default'])
        # print(self.imgs['default'].tobytes())
        self.disabled = False
        self.canvas.bind("<Enter>", self.entered)
        self.canvas.bind("<Leave>", self.left)
        self.canvas.bind("<Button-1>", self.clicked)
        self.canvas.bind("<ButtonRelease-1>", self.unclicked)
        self.action = action

    def unclicked(self, event):
        if not self.disabled:
            # for x in self.canvas.find_all():
            #     self.canvas.delete(x)
            self.canvas.create_image(0, 0, anchor=tk.NW, image=self.imgs['default'])

    def clicked(self, event):
        if not self.disabled:
            # for x in self.canvas.find_all():
            #     self.canvas.delete(x)
            self.canvas.create_image(0, 0, anchor=tk.NW, image=self.imgs['active'])
            self.action()

    def left(self, event):
        if not self.disabled:
            # for x in self.canvas.find_all():
            #     self.canvas.delete(x)
            self.canvas.create_image(0, 0, anchor=tk.NW, image=self.imgs['default'])

    def entered(self, event):
        if not self.disabled:
            # for x in self.canvas.find_all():
            #     # self.canvas.delete(x)
            self.canvas.create_image(0, 0, anchor=tk.NW, image=self.imgs['hover'])

    def disable(self):
        self.disabled = True

    def enable(self):
        self.disabled = False


class Infernet_GUI:
    """
    """

    def __init__(self):
        # constants
        self.color_0 = "#1A0E00"
        self.color_1 = "#4D1C00"
        self.color_2 = "#821800"
        self.color_3 = "#FFAE00"
        self.color_h0 = "#EEEEEE"
        self.color_h1 = "#E69D00"
        if os.name == 'nt':
            self.font = ('ariel', 14)
            self.font2 = ('ariel', 16, 'bold')
            self.fontb = ('ariel', 12, 'bold')
        else:
            self.font = ('ariel', 14)
            self.font2 = ('ariel', 16, 'bold')
            self.fontb = ('ariel', 12, 'bold')

        # instantiate window
        self.root = tk.Tk()
        self.root.title("Infernet")
        self.root.geometry("1024x640")
        self.content = ttk.Frame(self.root, padding=0)
        self.content.pack(fill=tk.BOTH, expand=1)

        # instantiate static bg
        self.bg = Pil_ImageTk.PhotoImage(Pil_Image.open("Static.png"))
        self.bg_label = tk.Label(self.content, image=self.bg)
        self.bg_label.place(relx=0.5, rely=0.5, anchor='center')

        # instantiate string labels
        self.lb_address = tk.StringVar()
        self.lb_address.set("1.1.1.1")
        self.lb_address_lbl = make_fixed_label(self.content, 94, 285, 22, 198,
                                               textvariable=self.lb_address,
                                               bg='white',
                                               fg=self.color_1,
                                               justify="left",
                                               anchor=tk.W,
                                               font=self.font)

        self.nn_address = tk.StringVar()
        self.nn_address.set("2.2.2.2")
        self.nn_address_lbl = make_fixed_label(self.content, 94, 365, 22, 198,
                                               textvariable=self.nn_address,
                                               bg='white',
                                               fg=self.color_1,
                                               justify="left",
                                               anchor=tk.W,
                                               font=self.font)

        self.directory = tk.StringVar()
        self.directory.set("/.././.././../.")
        self.directory_lbl = make_fixed_label(self.content, 186, 154, 22, 680,
                                              textvariable=self.directory,
                                              bg='white',
                                              fg=self.color_1,
                                              justify="left",
                                              anchor=tk.W,
                                              font=self.font)

        self.file_count = tk.StringVar()
        self.file_count.set("No Files Found")
        self.file_count_lbl = make_fixed_label(self.content, 882, 158, 14, 142,
                                               textvariable=self.file_count,
                                               bg=self.color_1,
                                               fg=self.color_3,
                                               justify="left",
                                               anchor=tk.W,
                                               font=self.font)

        #instantiate buttons
        self.infer_btn = TCB(text="START",
                             width=96,
                             height=30,
                             corner_radius=5,
                             command=None,
                             bg_color=self.color_2,
                             fg_color=self.color_3,
                             text_color=self.color_1,
                             text_font=self.font2,
                             hover_color=self.color_h1)
        self.infer_btn.place(x=736, y=208)

        self.browse_btn = TCB(text="Browse",
                              width=74,
                              height=22,
                              corner_radius=5,
                              command=None,
                              bg_color=self.color_1,
                              fg_color='white',
                              text_color=self.color_1,
                              text_font=self.fontb,
                              hover_color=self.color_h0)
        self.browse_btn.place(x=96, y=154)

        self.lb_btn = TCB(text="Auto-Detect",
                              width=83,
                              height=22,
                              corner_radius=5,
                              command=None,
                              bg_color=self.color_2,
                              fg_color='white',
                              text_color=self.color_1,
                              text_font=self.fontb,
                              hover_color=self.color_h0)
        self.lb_btn.place(x=209, y=254)

        self.ia_btn = TCB(text="Request",
                              width=83,
                              height=22,
                              corner_radius=5,
                              command=None,
                              bg_color=self.color_2,
                              fg_color='white',
                              text_color=self.color_1,
                              text_font=self.fontb,
                              hover_color=self.color_h0)
        self.ia_btn.place(x=209, y=334)

        # other properties
        self.image_list = []
        self.stats = Infernet_Statistics()

        # self.image_display_frame, \
        # self.sent_img_canvas, \
        # self.sent_img_id, \
        # self.stats_canvas, \
        # self.stats_fig = self.build_image_display(self.root,
        #                                           self.placeholder_sent_image)

    def browse_for_directory_callback(self):
        directory = tk.filedialog.askdirectory(title="Select Directory")
        self.directory.set(directory)

    def infer_button_callback(self):
        """
        Validate inputs and kick off inferences
        """
        logging.info("Infer button pressed, verifying inputs")
        lb_ip = self.lb_address.get()
        lb_port = self.lb_port.get()
        directory = self.directory.get()
        inputs_okay, err_msg = self.validate_inputs(lb_ip, lb_port, directory)
        if not inputs_okay:
            logging.info("User entered bad inputs" + err_msg)
            self.system_status.set(err_msg)
            return

        mnist_image_regex = "[0-9]-*.jpg"
        image_path_list = glob.glob(directory + "/" + mnist_image_regex)
        if len(image_path_list) == 0:
            logging.info("No images found in directory " + directory)
            self.system_status.set("No Images Found")
            return

        self.system_status.set("CONTACTING LB")
        # TODO interface with LB
        # ia = "1.1.8.2"
        lb, ia = self.contact_lb_and_get_ips()
        if lb is None or ia is None:
            return

        self.configure_image_list(image_path_list)

        self.inference_loop(ia, 666)
        self.system_status.set("DONE WITH INFERENCE")
        cli.return_ia_to_lb(None, lb, ia)

    def contact_lb_and_get_ips(self):
        fpganet = n532.get_fpganet()
        lb = cli.scan_for_lb(fpganet)
        if lb is None:
            self.system_status.set("ERROR: LB NOT FOUND")
            return None, None
        logging.info("Found lb:" + lb)
        ia = cli.get_ia_from_lb(fpganet, lb)
        if ia is not None:
            logging.info("Got ia:" + ia)

        # get_ia_from_lb(fpganet, lb)

        return lb, ia

    def inference_loop(self, ia_ip, ia_port):
        self.stats.reset()
        fpganet = n532.get_fpganet()

        curr_img = 0
        for image_dict in self.image_list:
            image_nn = image_dict["nn"]
            image_gui = image_dict["gui"]
            image_label = image_dict["label"]
            logging.info(image_dict["path"])

            # Update GUI before inference
            self.system_status.set("INFERING (%d/%d)" % (curr_img + 1, len(self.image_list)))
            self.sent_img_canvas.itemconfig(self.sent_img_id, image=image_gui)
            self.sent_img_canvas.update_idletasks()

            # Do inference, get result
            start_time = timer()
            encoded_result = n532.send_inference_packet_hardcore(fpganet, ia_ip, image_nn.tobytes())
            decoded_result = self.decode_result(encoded_result)
            logging.info("Result is %d" % (decoded_result))
            inference_correct = image_label == decoded_result
            end_time = timer()

            # Update statistics and redraw
            round_trip_time = end_time - start_time
            logging.info("Got round trip time of %f" % (round_trip_time))
            self.stats.update(round_trip_time, str(image_label), inference_correct)
            self.stats.plot(self.stats_fig)
            self.stats_canvas.draw()
            self.stats_canvas.get_tk_widget().update_idletasks()

            time.sleep(0)
            curr_img += 1

        self.system_status.set("DONE")

    def decode_result(self, encoded_bytes):
        return int.from_bytes(encoded_bytes, byteorder='big')

    def configure_image_list(self, image_path_list):
        self.image_list = []
        for image_path in image_path_list:
            image_nn = self.load_and_shape_image_for_nn(image_path)
            image_gui = Pil_ImageTk.PhotoImage(self.reshape_nn_img_for_gui(image_nn))
            image_label = int(os.path.basename(image_path)[0])
            image_data_dict = {"nn": image_nn, "gui": image_gui, "path": image_path, "label": image_label}
            self.image_list.append(image_data_dict)

    def validate_inputs(self, ip, port, directory):
        return True, ""

    def build_title(self, root):
        """
        Build title
        """
        frame = tk.Label(root, image=self.title_image)
        return frame

    def build_user_entry(self, root):
        """
        Build user input for inferences
        """
        user_entry_frame = tk.Frame(root)

        directory_label = tk.Label(user_entry_frame, text="Select Directory:", font=FONT_LABELS)

        directory_select = tk.Button(user_entry_frame,
                                     text="Browse",
                                     command=self.browse_for_directory_callback,
                                     font=FONT_ENTRIES)

        directory_display = tk.Label(user_entry_frame, textvariable=self.directory, font=FONT_ENTRIES)

        directory_display_label = tk.Label(user_entry_frame, text="Using Directory:", font=FONT_LABELS)

        directory_label.grid(row=0, column=0)
        directory_select.grid(row=0, column=1)
        directory_display_label.grid(row=1, column=0)
        directory_display.grid(row=1, column=1, columnspan=3, sticky="W")

        return user_entry_frame

    def build_metrics_bar(self):
        pass

    def build_image_display(self, root, initial_image):
        frame = tk.Frame(root)

        sent_image_canvas = tk.Canvas(frame, width=GUI_IMG_INPUT_W, height=GUI_IMG_INPUT_H)
        image_id = sent_image_canvas.create_image(0,
                                                  0,
                                                  anchor="nw",
                                                  image=initial_image)

        fig = Figure(figsize=(5, 4), dpi=100)
        fig_canvas = FigureCanvasTkAgg(fig, master=frame)

        sent_image_canvas.grid(row=0, column=0, padx=20, pady=40)
        fig_canvas.get_tk_widget().grid(row=0, column=1, padx=20, pady=40)

        return frame, sent_image_canvas, image_id, fig_canvas, fig

    def build_verified_sign_display(self, root):
        pass

    def build_status_bar(self, root, status_var):
        status_frame = tk.Frame(root)
        status_label = tk.Label(status_frame, text="System Status", font=FONT_LABELS)
        status_text = tk.Label(status_frame,
                               textvariable=status_var,
                               height=1,
                               width=25,
                               bg="light cyan")
        status_label.pack()
        status_text.pack()
        return status_frame

    def build_infer_button_panel(self, root):
        infer_button_frame = tk.Frame(root)
        infer_button = tk.Button(infer_button_frame, text="Infer", command=self.infer_button_callback)
        infer_button.pack()
        return infer_button_frame

    def load_and_shape_image_for_nn(self, img_path):
        img = Pil_Image.open(img_path)
        img = Pil_ImageOps.grayscale(img)

        if NN_INPUT_W < img.width or NN_INPUT_H < img.height:
            img = img.resize((NN_INPUT_W, NN_INPUT_H), Pil_Image.BILINEAR)
        elif NN_INPUT_W == img.width or NN_INPUT_H == img.height:
            pass
        else:
            img = img.resize((NN_INPUT_W, NN_INPUT_H), Pil_Image.BICUBIC)

        return img

    def reshape_nn_img_for_gui(self, img):
        img = img.resize((GUI_IMG_INPUT_W, GUI_IMG_INPUT_H), Pil_Image.BICUBIC)
        return img


def main():
    """
    Main function
    """
    logging.basicConfig(level=logging.INFO, format='%(levelname)s-%(asctime)s- %(message)s')
    logging.info("Starting Infernet.")
    gui = Infernet_GUI()
    gui.root.mainloop()


if __name__ == '__main__':
    main()
