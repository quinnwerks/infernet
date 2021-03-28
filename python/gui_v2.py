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

GUI_IMG_INPUT_W = 134-4
GUI_IMG_INPUT_H = 134-4

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


def make_fixed_entry(parent, x, y, h, w, *args, **kwargs) -> tk.Entry:
    f = tk.Frame(parent, height=h-2, width=w, highlightthickness=0)
    f.place(x=x, y=y)
    f.pack_propagate(0)  # don't shrink
    lbl = tk.Entry(f, highlightthickness=0, relief='flat', *args, **kwargs)
    lbl.pack(fill=tk.BOTH, expand=1)
    return lbl


def load_and_shape_image_for_nn(img_path):
    img = Pil_Image.open(img_path)
    img = Pil_ImageOps.grayscale(img)
    if NN_INPUT_W < img.width or NN_INPUT_H < img.height:
        img = img.resize((NN_INPUT_W, NN_INPUT_H), Pil_Image.BILINEAR)
    elif NN_INPUT_W == img.width and NN_INPUT_H == img.height:
        pass
    else:
        img = img.resize((NN_INPUT_W, NN_INPUT_H), Pil_Image.BICUBIC)
    return img


def reshape_nn_img_for_gui(img):
    img = img.resize((GUI_IMG_INPUT_W, GUI_IMG_INPUT_H), Pil_Image.NEAREST)
    return img


def decode_result(encoded_bytes):
    return int.from_bytes(encoded_bytes, byteorder='big')


class Infernet_GUI:
    """
    """

    def __init__(self):
        # constants
        self.colors = {
            "0": "#1A0E00",
            "1": "#4D1C00",
            "2": "#821800",
            "3": "#B30000",
            "hl": "#FFAE00",
            "btn": "#FFFFFF",
            "btn_h": "#EEEEEE",
            "hl_h": "#E69D00",
            "hl_d": "#996900",
            "1_d": "#4D2F1F"
        }
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
        self.lb_address_lbl = make_fixed_entry(self.content, 94, 287-2, 22+2, 198,
                                               textvariable=self.lb_address,
                                               bg=self.colors['btn'],
                                               fg=self.colors['1'],
                                               justify="left",
                                               font=self.font)

        self.ia_address = tk.StringVar()
        self.ia_address.set("2.2.2.2")
        self.ia_address.trace_add("write", self.update_start_btn_status)
        self.ia_address_lbl = make_fixed_entry(self.content, 94, 367-2, 22+2, 198,
                                               textvariable=self.ia_address,
                                               bg=self.colors['btn'],
                                               fg=self.colors['1'],
                                               justify="left",
                                               font=self.font)

        self.directory = tk.StringVar()
        self.directory.set("Please Browse for Path")
        self.directory_lbl = make_fixed_entry(self.content, 186, 154, 22+2, 680,
                                              textvariable=self.directory,
                                              bg=self.colors['btn'],
                                              fg=self.colors['1'],
                                              justify="left",
                                              font=self.font)

        self.file_count = tk.StringVar()
        self.file_count.set("No Images Found")
        self.file_count_lbl = make_fixed_label(self.content, 878, 154, 22, 142,
                                               textvariable=self.file_count,
                                               bg=self.colors['1'],
                                               fg=self.colors['hl'],
                                               justify="left",
                                               anchor=tk.W,
                                               font=self.font)

        # instantiate buttons
        self.infer_btn = TCB(text="START",
                             width=96,
                             height=30,
                             corner_radius=5,
                             command=None,
                             bg_color=self.colors['2'],
                             fg_color=self.colors['hl_d'],
                             text_color=self.colors['1_d'],
                             text_font=self.font2,
                             hover_color=self.colors['hl_d'])
        self.infer_btn.place(x=736, y=208)

        self.browse_btn = TCB(text="Browse",
                              width=74,
                              height=22,
                              corner_radius=5,
                              command=self.browse_for_directory_callback,
                              bg_color=self.colors['1'],
                              fg_color=self.colors['btn'],
                              text_color=self.colors['1'],
                              text_font=self.fontb,
                              hover_color=self.colors['btn_h'])
        self.browse_btn.place(x=96, y=154)

        self.lb_btn = TCB(text="Auto-Detect",
                          width=83,
                          height=22,
                          corner_radius=5,
                          command=None,
                          bg_color=self.colors['2'],
                          fg_color=self.colors['btn'],
                          text_color=self.colors['1'],
                          text_font=self.fontb,
                          hover_color=self.colors['btn_h'])
        self.lb_btn.place(x=209, y=254)

        self.ia_btn = TCB(text="Request",
                          width=83,
                          height=22,
                          corner_radius=5,
                          command=None,
                          bg_color=self.colors['2'],
                          fg_color=self.colors['btn'],
                          text_color=self.colors['1'],
                          text_font=self.fontb,
                          hover_color=self.colors['btn_h'])
        self.ia_btn.place(x=209, y=334)

        # instantiate inference images
        self.infer_input_bg_img = Pil_ImageTk.PhotoImage(
            Pil_Image.open("nn_bg.png").resize((GUI_IMG_INPUT_W, GUI_IMG_INPUT_H), Pil_Image.NEAREST))
        self.infer_input_img_label = tk.Label(self.content, image=self.infer_input_bg_img, bg=self.colors['1'])
        self.infer_input_img_label.place(x=324, y=253)

        self.infer_output_bg_img = Pil_ImageTk.PhotoImage(
            Pil_Image.open("nn_bg.png").resize((GUI_IMG_INPUT_W, GUI_IMG_INPUT_H), Pil_Image.NEAREST))
        self.infer_output_img_label = tk.Label(self.content, image=self.infer_output_bg_img, bg=self.colors['1'])
        self.infer_output_img_label.place(x=570, y=253)

        # other properties
        self.image_list = []
        self.num_imgs = [
            Pil_ImageTk.PhotoImage(Pil_Image.open("num/classification ("+str(x)+").png"))
            for x in range(10)]
        self.last_start_btn_status = False
        # self.stats = Infernet_Statistics()

        # self.image_display_frame, \
        # self.sent_img_canvas, \
        # self.sent_img_id, \
        # self.stats_canvas, \
        # self.stats_fig = self.build_image_display(self.root,
        #                                           self.placeholder_sent_image)

    def browse_for_directory_callback(self):
        directory = tk.filedialog.askdirectory(title="Select Directory")
        self.directory.set(directory)
        self.configure_image_list()

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

        # mnist_image_regex = "[0-9]-*.jpg"
        # image_path_list = glob.glob(directory + "/" + mnist_image_regex)
        # if len(image_path_list) == 0:
        #     logging.info("No images found in directory " + directory)
        #     self.system_status.set("No Images Found")
        #     return

        self.system_status.set("CONTACTING LB")
        # TODO interface with LB
        # ia = "1.1.8.2"
        lb, ia = self.contact_lb_and_get_ips()
        if lb is None or ia is None:
            return

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
            decoded_result = decode_result(encoded_result)
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

    def change_start_btn_mode(self, is_inference):
        if is_inference:
            self.infer_btn.text_label['text'] = "STOP"
            self.infer_btn.configure_color(self.colors['2'], self.colors['hl'], self.colors['hl_h'], self.colors['1'])
            self.infer_btn.function = self.infer_stop_callback
        else:
            self.infer_btn.text_label['text'] = "START"
            self.update_start_btn_status()

    def update_start_btn_status(self, name=None, index=None, mode=None) -> None:
        new_status = bool(n532.fpga_ip_to_num(self.ia_address.get()) and self.image_list)
        if new_status != self.last_start_btn_status:
            if new_status:
                self.infer_btn.configure_color(self.colors['2'], self.colors['hl'], self.colors['hl_h'], self.colors['1'])
                self.infer_btn.function = self.infer_button_callback
            else:
                self.infer_btn.configure_color(self.colors['2'], self.colors['hl_d'], self.colors['hl_d'], self.colors['1_d'])
                self.infer_btn.function = lambda: print("START button disabled!")
        self.last_start_btn_status = new_status

    def put_gui_inference_img(self, img) -> None:
        self.infer_input_img_label.configure(image=img)

    def put_gui_output_img(self, num: int) -> None:
        self.infer_output_img_label.configure(image=self.num_imgs[num])

    def configure_image_list(self):
        self.image_list = []
        mnist_image_regex = "[0-9]-*.jpg"
        image_path_list = glob.glob(self.directory.get() + "/" + mnist_image_regex)
        if len(image_path_list) == 0:
            self.file_count.set("No Images Found")
        else:
            for image_path in image_path_list:
                image_nn = load_and_shape_image_for_nn(image_path)
                image_gui = Pil_ImageTk.PhotoImage(reshape_nn_img_for_gui(image_nn))
                image_label = int(os.path.basename(image_path)[0])
                image_data_dict = {"nn": image_nn, "gui": image_gui, "path": image_path, "label": image_label}
                self.image_list.append(image_data_dict)
            self.file_count.set(f"{len(image_path_list)} Images Found")
            self.put_gui_inference_img(self.image_list[0]['gui'])
            self.update_start_btn_status()


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
