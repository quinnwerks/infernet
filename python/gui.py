#!python
# targeting 3.7.2
"""
Infernet GUI module.
Built on top of networking utilities.
"""
import logging
import glob
import time
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
from PIL import Image as Pil_Image, ImageTk as Pil_ImageTk
import PIL.ImageOps as Pil_ImageOps

#import networking532 as n532

NN_INPUT_W = 28
NN_INPUT_H = 28

GUI_IMG_INPUT_W = 280
GUI_IMG_INPUT_H = 280

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
        self.correct_classifications = {"0":0, "1":0, "2":0, "3":0, "4":0,
                                        "5":0, "6":0, "7":0, "8":0, "9":0}
        self.incorrect_classifications = {"0":0, "1":0, "2":0, "3":0, "4":0,
                                          "5":0, "6":0, "7":0, "8":0, "9":0}

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
        rtt_plot.title.set_text("Round Trip Time")


        # Bar graph for correct classifications
        class_bar = figure.add_subplot(2, 1, 2)
        bar_x = np.arange(len(self.correct_classifications.keys()))
        class_bar.set_xticks(bar_x)
        class_bar.set_xticklabels(self.correct_classifications.keys())

        bar_y_correct = self.correct_classifications.values()
        bar_y_incorrect = self.incorrect_classifications.values()

        bar_width = 0.2
        class_bar.bar(bar_x-bar_width/2, bar_y_correct, width=bar_width,
                      color='b', align='center', label="correct")
        class_bar.bar(bar_x+bar_width/2, bar_y_incorrect, width=bar_width,
                      color='r', align='center', label="incorrect")

        # Set bar graph to integer labels only on y axis
        class_bar.set_yticks(np.arange(0, max(bar_y_incorrect)+1, 1))

        class_bar.title.set_text("Classification Accuracy")
        class_bar.legend()

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
        self.correct_classifications = {"0":0, "1":0, "2":0, "3":0, "4":0,
                                        "5":0, "6":0, "7":0, "8":0, "9":0}
        self.incorrect_classifications = {"0":0, "1":0, "2":0, "3":0, "4":0,
                                          "5":0, "6":0, "7":0, "8":0, "9":0}



class Infernet_GUI:
    """
    """
    def __init__(self):
        self.root = tk.Tk()
        self.root.title("Infernet")
        self.root.geometry("1000x800")

        self.title_image = Pil_ImageTk.PhotoImage(Pil_Image.open("doom_title.png"))
        self.placeholder_sent_image = Pil_ImageTk.PhotoImage(
            self.reshape_nn_img_for_gui(self.load_and_shape_image_for_nn("devil.jpg")))

        self.lb_address = tk.StringVar()
        self.lb_port = tk.StringVar()
        self.directory = tk.StringVar()
        self.system_status = tk.StringVar()
        self.system_status.set("IDLE")
        self.directory.set(os.getcwd())
        self.image_list = []
        self.stats = Infernet_Statistics()

        self.title_frame = self.build_title(self.root)
        self.user_entry_frame = self.build_user_entry(self.root)

        self.image_display_frame,\
        self.sent_img_canvas,\
        self.sent_img_id,\
        self.stats_canvas,\
        self.stats_fig = self.build_image_display(self.root,
                                                  self.placeholder_sent_image)

        self.status_bar = self.build_status_bar(self.root, self.system_status)
        self.infer_panel = self.build_infer_button_panel(self.root)

        self.title_frame.pack()
        self.user_entry_frame.pack()
        self.image_display_frame.pack()
        self.status_bar.pack()
        self.infer_panel.pack()


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

        image_path_list = glob.glob(directory + "/*.jpg")
        if image_path_list is []:
            logging.info("No images found in directory " + directory)
            self.system_status.set("No Images Found")

        self.system_status.set("CONTACTING LB")
        # TODO interface with LB

        self.configure_image_list(image_path_list)
        self.inference_loop("1.1.2.2", 666)


    def inference_loop(self, ia_ip, ia_port):
        self.stats.reset()
        fpganet = "" #n532.get_fpganet()

        curr_img = 0
        for image_dict in self.image_list:
            image_nn = image_dict["nn"]
            image_gui = image_dict["gui"]
            image_label = image_dict["label"]
            logging.info(image_dict["path"])

            # Update GUI before inference
            self.system_status.set("INFERING (%d/%d)" % (curr_img+1, len(self.image_list)))
            self.sent_img_canvas.itemconfig(self.sent_img_id, image=image_gui)
            self.sent_img_canvas.update_idletasks()

            # Do inference, get result
            start_time = time.time()
            encoded_result = [0, 1] #n532.send_inference_packet_hardcore(fpganet, ia_ip, image_nn.tobytes())
            decoded_result = self.decode_result(encoded_result)
            logging.info("Result is %d" % (decoded_result))
            inference_correct = image_label == decoded_result
            end_time = time.time()

            # Update statistics and redraw
            round_trip_time = end_time - start_time
            self.stats.update(round_trip_time, str(image_label), inference_correct)
            self.stats.plot(self.stats_fig)
            self.stats_canvas.draw()
            self.stats_canvas.get_tk_widget().update_idletasks()


            time.sleep(1)
            curr_img += 1

        self.system_status.set("DONE")


    def decode_result(self, encoded_bytes):
        return int.from_bytes(encoded_bytes, byteorder='big')

    def configure_image_list(self, image_path_list):
        self.image_list = []
        for image_path in image_path_list:
            image_nn = self.load_and_shape_image_for_nn(image_path)
            image_gui = Pil_ImageTk.PhotoImage(self.reshape_nn_img_for_gui(image_nn))
            image_data_dict = {"nn":image_nn, "gui":image_gui, "path":image_path, "label":0}
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

        # Configure ip address entry
        directory_label = tk.Label(user_entry_frame, text="Select Directory:", font=FONT_LABELS)

        lb_address_entry = tk.Entry(user_entry_frame,
                                    textvariable=self.lb_address,
                                    font=FONT_ENTRIES)

        lb_port_entry = tk.Entry(user_entry_frame,
                                 textvariable=self.lb_port,
                                 font=FONT_ENTRIES)

        directory_select = tk.Button(user_entry_frame,
                                    text="Browse",
                                    command=self.browse_for_directory_callback,
                                    font=FONT_ENTRIES)

        directory_display = tk.Label(user_entry_frame, textvariable=self.directory, font=FONT_ENTRIES)

        directory_display_label = tk.Label(user_entry_frame, text="Using Directory:", font=FONT_LABELS)

        directory_label.grid(row=0, column=0)
        directory_select.grid(row=0, column=1, sticky="W")
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
