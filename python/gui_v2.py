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
import math
import threading
import queue
import concurrent.futures as cf
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

COLORS = {
    "0": "#1A0E00",
    "1": "#4D1C00",
    "2": "#821800",
    "3": "#B30000",
    "hl": "#FFAE00",
    "btn": "#FFFFFF",
    "btn_h": "#EEEEEE",
    "btn_d": "#CCCCCC",
    "btn_dt": "#4D4D4D",
    "hl_h": "#E69D00",
    "hl_d": "#996900",
    "1_d": "#4D2F1F",
    "plot_red": "#B30000",
    "plot_green": "#68B312",
    "plot_cyan": "#12B3B2",
    "plot_purple": "#9A09B3",
    "plot_label": "#FFAE00",
    "plot_bg": "#4D1C00"
}

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

    def plot(self, rtt_fig, acc_fig):
        rtt_fig.clf()
        acc_fig.clf()

        # Line graph for round trip time
        rtt_plot = rtt_fig.add_subplot(1, 1, 1)
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
        class_bar = acc_fig.add_subplot(1, 1, 1)
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

        # figure.tight_layout(pad=2.0)

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


class PieceMap:
    def __init__(self, parent, count, hover_cb):
        self.count = count
        self.hover_cb = hover_cb
        x_start = 736
        y_start = 254
        # dataset has 42000, w = 272, h = 134
        w_thresh = [((16, 4, 14, 7), 98),
                    ((14, 3, 16, 8), 128),
                    ((12, 3, 18, 9), 162),
                    ((10, 2, 23, 11), 253),
                    ((8, 2, 27, 13), 351),
                    ((6, 2, 34, 17), 578),
                    ((5, 2, 39, 19), 741),
                    ((5, 1, 45, 23), 1035),
                    ((4, 1, 55, 27), 1485),
                    ((3, 1, 68, 34), 2312),
                    ((4, 1, 55, 27), 1485),
                    ((2, 1, 91, 45), 4095),
                    ((2, 0, 136, 67), 9112),
                    # ((1, 0, 272, 134), 36448)]
                    ((1, 0, 272, 134), 0x7fffffff)]
        sizes = min([x for x in w_thresh if x[1] > count], key=lambda x: x[1])[0]
        self.sizes = sizes
        w = sizes[0] * sizes[2] + sizes[1] * (sizes[2] - 1)
        h = sizes[0] * sizes[3] + sizes[1] * (sizes[3] - 1)
        self.canvas = tk.Canvas(parent, width=w, height=h, bg=COLORS['2'], highlightthickness=0)
        self.canvas.place(x=x_start, y=y_start)
        self.pieces = []

        def make_cb_lambda(cb, i, entered):
            return lambda *args: cb(i, entered)

        for i in range(count):
            x1 = (sizes[0] + sizes[1]) * (i % sizes[2])
            x2 = x1 + sizes[0]
            y1 = (sizes[0] + sizes[1]) * (i // sizes[2])
            y2 = y1 + sizes[0]
            tag = self.canvas.create_rectangle(x1, y1, x2, y2, fill=COLORS['1'], outline=COLORS['1'], width=0)
            self.pieces.append(tag)
            self.canvas.tag_bind(tag, '<Enter>', make_cb_lambda(hover_cb, i, True))
            self.canvas.tag_bind(tag, '<Leave>', make_cb_lambda(hover_cb, i, False))

    def destroy(self):
        self.canvas.destroy()

    def state(self, num: int, state: str):
        if state == 'init':
            self.canvas.itemconfigure(self.pieces[num], fill=COLORS['1'], width=0)
        if state == 'null':
            self.canvas.itemconfigure(self.pieces[num], fill=COLORS['2'], width=1)
        if state == 'bad':
            self.canvas.itemconfigure(self.pieces[num], fill=COLORS['3'], width=0)
        if state == 'good':
            self.canvas.itemconfigure(self.pieces[num], fill=COLORS['hl'], width=0)
        if state == 'dark':
            self.canvas.itemconfigure(self.pieces[num], fill=COLORS['0'], width=0)


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
    return int(math.log2(encoded_bytes))


class Infernet_GUI:
    """
    """

    def __init__(self):
        # constants
        self.colors = COLORS
        if os.name == 'nt':
            self.font = ('ariel', 10)
            self.font2 = ('ariel', 12, 'bold')
            self.fontb = ('ariel', 9, 'bold')
        else:
            self.font = ('helvetica', 14)
            self.font2 = ('helvetica', 16, 'bold')
            self.fontb = ('helvetica', 12, 'bold')

        # instantiate window
        self.root = tk.Tk()
        self.root.title("Infernet")
        self.root.geometry(f"1024x640+{int(self.root.winfo_screenwidth()/2-512)}+{int(self.root.winfo_screenheight()/2-320)}")
        self.root.resizable(False, False)
        self.root.protocol("WM_DELETE_WINDOW", self.close_up_shop)
        self.content = ttk.Frame(self.root, padding=0)
        self.content.pack(fill=tk.BOTH, expand=1)

        # other properties and state
        self.image_list = []
        self.piece_map = None
        self.result_labels = []
        self.hovering = -1
        self.num_imgs = [
            Pil_ImageTk.PhotoImage(Pil_Image.open("num/classification (" + str(x) + ").png"))
            for x in range(11)]
        self.last_start_btn_status = False
        self.last_ia_btn_status = False
        self.lb_got = False
        self.ia_got = False
        self.inferring = False
        self.stats = Infernet_Statistics()
        if os.name == 'nt':
            self.fpganet = n532.get_fpganet()
        self.result_render_queue = queue.SimpleQueue()
        self.quit_event = threading.Event()
        self.stop_event = threading.Event()
        self.root.bind('<<update>>', self.queue_update_hook)
        self.update_generator_thread = threading.Thread(target=self.update_event_generator)
        self.update_generator_thread.start()

        # instantiate static bg
        self.bg = Pil_ImageTk.PhotoImage(Pil_Image.open("Static.png"))
        self.bg_label = tk.Label(self.content, image=self.bg)
        self.bg_label.place(relx=0.5, rely=0.5, anchor='center')

        # instantiate contents
        self.build_labels_and_fields()
        self.build_buttons()
        self.build_inference_images()
        self.build_piece_map()
        self.build_stats_display()

        # get accelerator
        if os.name == 'nt' and self.fpganet:
            self.scan_for_lb_callback()
            if self.lb_got:
                self.request_ia_callback()


    def close_up_shop(self, *args):
        if self.inferring:
            self.stop_event.set()
            self.infer_thread_inst.join()
        self.quit_event.set()
        while not self.result_render_queue.empty():
            self.result_render_queue.get()
        if self.update_generator_thread:
            self.update_generator_thread.join()
        if self.ia_got:
            cli.return_ia_to_lb(self.fpganet, self.lb_address.get(), self.ia_got)
        self.root.destroy()

    def update_event_generator(self):
        time.sleep(1)
        while True:
            time.sleep(1/60)
            if self.quit_event.isSet():
                return
            self.root.event_generate('<<update>>', when='tail')

    def queue_update_hook(self, ev):
        max_updates = 10
        while max_updates and not self.result_render_queue.empty():
            i, encoded_result, rtt = self.result_render_queue.get()
            image_dict = self.image_list[i]
            image_gui = image_dict["gui"]
            image_label = image_dict["label"]
            if encoded_result:
                # decode
                decoded_result = decode_result(encoded_result)
                inference_correct = bool(image_label == decoded_result)
                self.result_labels.append(decoded_result)
                # update piecemap
                if inference_correct:
                    self.piece_map.state(i, 'good')
                else:
                    self.piece_map.state(i, 'bad')
                if self.hovering == -1:
                    self.put_gui_inference_img(image_gui)
                    self.put_gui_output_img(decoded_result)
                elif self.hovering == i:
                    self.put_gui_output_img(decoded_result)
                # update graphs
                self.stats.update(rtt, str(image_label), inference_correct)
                self.stats.plot(self.rtt_fig, self.acc_fig)
                self.rtt_canvas.draw()
                self.acc_canvas.draw()
                self.rtt_canvas.get_tk_widget().update_idletasks()
                self.acc_canvas.get_tk_widget().update_idletasks()
            else:
                self.piece_map.state(i, 'dark')
                self.result_labels.append(10)
                if self.hovering == -1:
                    self.put_gui_inference_img(image_gui)
                    self.put_gui_output_img(10)
            if i == len(self.image_list) - 1:
                self.inferring = False
                self.infer_restore_state()
                self.update_start_btn_status()
        if self.stop_event.isSet():
            while not self.result_render_queue.empty():
                self.result_render_queue.get()
            self.inferring = False
            self.update_start_btn_status()
            self.infer_restore_state()
            self.stop_event.clear()

    def build_inference_images(self):
        # instantiate inference images
        self.infer_input_bg_img = Pil_ImageTk.PhotoImage(
            Pil_Image.open("nn_bg.png").resize((GUI_IMG_INPUT_W, GUI_IMG_INPUT_H), Pil_Image.NEAREST))
        self.infer_input_img_label = tk.Label(self.content, image=self.infer_input_bg_img, bg=self.colors['1'])
        self.infer_input_img_label.place(x=324, y=253)
        self.infer_output_bg_img = Pil_ImageTk.PhotoImage(
            Pil_Image.open("nn_bg.png").resize((GUI_IMG_INPUT_W, GUI_IMG_INPUT_H), Pil_Image.NEAREST))
        self.infer_output_img_label = tk.Label(self.content, image=self.infer_output_bg_img, bg=self.colors['1'])
        self.infer_output_img_label.place(x=570, y=253)

    def build_labels_and_fields(self):
        # instantiate string labels
        self.lb_address = tk.StringVar()
        self.lb_address.set("1.1.1.1")
        self.lb_address.trace_add("write", self.update_ia_btn_status)
        self.lb_address_lbl = make_fixed_entry(self.content, 94, 287 - 2, 22 + 2, 198,
                                               textvariable=self.lb_address,
                                               bg=self.colors['btn'],
                                               fg=self.colors['1'],
                                               justify="left",
                                               font=self.font)

        self.ia_address = tk.StringVar()
        self.ia_address.set("2.2.2.2")
        self.ia_address.trace_add("write", self.update_start_btn_status)
        self.ia_address_lbl = make_fixed_entry(self.content, 94, 367 - 2, 22 + 2, 198,
                                               textvariable=self.ia_address,
                                               bg=self.colors['btn'],
                                               fg=self.colors['1'],
                                               justify="left",
                                               font=self.font)

        self.directory = tk.StringVar()
        self.directory.set("Please Browse for Path")
        self.directory_lbl = make_fixed_entry(self.content, 186, 154, 22 + 2, 680,
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

    def build_buttons(self):
        # instantiate buttons
        self.infer_btn = TCB(text="START",
                             width=96,
                             height=30,
                             corner_radius=6,
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
                              corner_radius=4,
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
                          corner_radius=4,
                          command=self.scan_for_lb_callback,
                          bg_color=self.colors['2'],
                          fg_color=self.colors['btn'],
                          text_color=self.colors['1'],
                          text_font=self.fontb,
                          hover_color=self.colors['btn_h'])
        self.lb_btn.place(x=209, y=254)
        self.ia_btn = TCB(text="Request",
                          width=83,
                          height=22,
                          corner_radius=4,
                          command=lambda *args: None,
                          bg_color=self.colors['2'],
                          fg_color=self.colors['btn_d'],
                          text_color=self.colors['btn_dt'],
                          text_font=self.fontb,
                          hover_color=self.colors['btn_d'])
        self.ia_btn.place(x=209, y=334)

    def build_piece_map(self):
        if self.piece_map:
            self.piece_map.destroy()
        if len(self.image_list):
            self.piece_map = PieceMap(self.content, len(self.image_list), self.piece_hover_callback)
        else:
            self.piece_map = PieceMap(self.root, 1, lambda *args: None)
            self.piece_map.state(0, 'null')

    def build_stats_display(self) -> None:
        self.rtt_fig = Figure(figsize=(4.5, 1.6), dpi=100)
        self.rtt_canvas = FigureCanvasTkAgg(self.rtt_fig, master=self.content)
        self.rtt_canvas.get_tk_widget().place(x=94, y=464)

        self.acc_fig = Figure(figsize=(4.5, 1.6), dpi=100)
        self.acc_canvas = FigureCanvasTkAgg(self.acc_fig, master=self.content)
        self.acc_canvas.get_tk_widget().place(x=558, y=464)

    def browse_for_directory_callback(self):
        directory = tk.filedialog.askdirectory(title="Select Directory")
        self.directory.set(directory)
        self.configure_image_list()

    def scan_for_lb_callback(self):
        lb_ip = cli.scan_for_lb(self.fpganet)
        if lb_ip:
            self.lb_address.set(lb_ip)
            self.lb_got = True
        else:
            self.lb_address.set("Scan Failed")
            self.lb_got = False
        self.update_ia_btn_status()

    def request_ia_callback(self):
        ia_ip = cli.get_ia_from_lb(self.fpganet, self.lb_address.get())
        if ia_ip:
            self.ia_address.set(ia_ip)
            self.ia_got = ia_ip
            self.change_ia_btn_mode(True, False)
            self.ia_address_lbl.configure(state='disabled')
            self.lb_address_lbl.configure(state='disabled')
            self.change_lb_btn_mode(False)
        else:
            self.ia_got = False
            self.ia_address.set("Request Failed")

    def return_ia_callback(self):
        self.ia_got = False
        success = cli.return_ia_to_lb(self.fpganet, self.lb_address.get(), self.ia_address.get())
        if success:
            self.ia_address.set("Returned")
        else:
            self.ia_address.set("Return Failed")
        self.ia_address_lbl.configure(state='normal')
        self.lb_address_lbl.configure(state='normal')
        self.change_ia_btn_mode(True, True)
        self.ia_btn.function = self.request_ia_callback
        self.change_lb_btn_mode(True)

    def infer_button_callback(self):
        self.inferring = True
        self.stats.reset()
        self.piece_map.destroy()
        self.result_labels = []
        self.build_piece_map()
        self.infer_backup_state()
        self.change_lb_btn_mode(False)
        self.change_ia_btn_mode(False, self.ia_btn_mode[1])
        self.update_start_btn_status()
        self.ia_address_lbl.configure(state='disabled')
        self.lb_address_lbl.configure(state='disabled')
        self.infer_thread_inst = threading.Thread(target=self.infer_thread)
        self.infer_thread_inst.start()

    def infer_thread(self):

        def network_worker():
            for i in range(len(self.image_list)):
                if self.stop_event.isSet():
                    break
                if self.quit_event.isSet():
                    break
                image_dict = self.image_list[i]
                start_time = timer()
                encoded_result = n532.send_inference_packet_hardcore(self.fpganet,
                                                                     self.ia_address.get(),
                                                                     image_dict["nn"].tobytes(),
                                                                     0.1)
                end_time = timer()
                rtt = end_time - start_time
                self.result_render_queue.put((i, encoded_result, rtt))
            pass

        network_thread = threading.Thread(target=network_worker)
        network_thread.start()
        network_thread.join()

    def infer_backup_state(self):
        self.prev_lb_lbl_state = self.lb_address_lbl.cget('state')
        self.prev_ia_lbl_state = self.ia_address_lbl.cget('state')
        self.prev_lb_btn_mode = self.lb_btn_mode
        self.prev_ia_btn_mode = self.ia_btn_mode

    def infer_restore_state(self):
        self.ia_address_lbl.configure(state=self.prev_ia_lbl_state)
        self.lb_address_lbl.configure(state=self.prev_lb_lbl_state)
        self.change_lb_btn_mode(self.prev_lb_btn_mode)
        self.change_ia_btn_mode(self.prev_ia_btn_mode[0], self.prev_ia_btn_mode[1])

    def infer_stop_callback(self):
        self.stop_event.set()
        pass

    def piece_hover_callback(self, i, entered):
        if entered:
            self.hovering = i
            imgs: dict = self.image_list[i]
            self.put_gui_inference_img(imgs['gui'])
            if len(self.result_labels) > i:
                self.put_gui_output_img(self.result_labels[i])
            else:
                self.infer_output_img_label.configure(image=self.infer_output_bg_img)
        else:
            self.hovering = -1

    def change_ia_btn_mode(self, enabled, req):
        self.ia_btn_mode = (enabled, req)
        if req:
            self.ia_btn.set_text("Request")
            if enabled:
                self.ia_btn.configure_color(self.colors['2'], self.colors['btn'], self.colors['btn_h'],
                                            self.colors['1'])
                self.ia_btn.function = self.request_ia_callback
            else:
                self.ia_btn.configure_color(self.colors['2'], self.colors['btn_d'], self.colors['btn_d'],
                                            self.colors['btn_dt'])
                self.ia_btn.function = lambda *args: None
        else:
            self.ia_btn.set_text("Return")
            if enabled:
                self.ia_btn.configure_color(self.colors['2'], self.colors['btn'], self.colors['btn_h'],
                                            self.colors['1'])
                self.ia_btn.function = self.return_ia_callback
            else:
                self.ia_btn.configure_color(self.colors['2'], self.colors['btn_d'], self.colors['btn_d'],
                                            self.colors['btn_dt'])
                self.ia_btn.function = lambda *args: None

    def change_lb_btn_mode(self, enabled):
        if enabled:
            self.lb_btn.configure_color(self.colors['2'], self.colors['btn'], self.colors['btn_h'], self.colors['1'])
            self.lb_btn.function = self.scan_for_lb_callback
        else:
            self.lb_btn.configure_color(self.colors['2'], self.colors['btn_d'], self.colors['btn_d'], self.colors['btn_dt'])
            self.lb_btn.function = lambda *args: None
        self.lb_btn_mode = enabled

    def update_start_btn_status(self, name=None, index=None, mode=None) -> None:
        if self.inferring:
            # self.infer_btn.text_label.configure(text="STOP")
            self.infer_btn.set_text("STOP")
            self.infer_btn.configure_color(self.colors['2'], self.colors['hl'], self.colors['hl_h'], self.colors['1'])
            self.infer_btn.function = self.infer_stop_callback
            # self.infer_btn.draw()
        else:
            if self.infer_btn.text != "START":
                # self.infer_btn.text_label.configure(text="START")
                self.infer_btn.set_text("START")
                self.infer_btn.configure_color(self.colors['2'], self.colors['hl'], self.colors['hl_h'],self.colors['1'])
                self.infer_btn.function = self.infer_button_callback
                # self.infer_btn.draw()
            if name and self.ia_got:
                if self.lb_got:
                    cli.return_ia_to_lb(self.fpganet, self.lb_address.get(), self.ia_got)
                self.ia_got = False
                self.change_ia_btn_mode(True, True)
                self.change_lb_btn_mode(True)
            new_status = bool(n532.fpga_ip_to_num(self.ia_address.get()) and self.image_list)
            if new_status != self.last_start_btn_status:
                # self.infer_btn.text_label['text'] = "START"
                if new_status:
                    self.infer_btn.configure_color(self.colors['2'], self.colors['hl'], self.colors['hl_h'], self.colors['1'])
                    self.infer_btn.function = self.infer_button_callback
                    # self.infer_btn.draw()
                else:
                    self.infer_btn.configure_color(self.colors['2'], self.colors['hl_d'], self.colors['hl_d'], self.colors['1_d'])
                    self.infer_btn.function = lambda *args: print("START button disabled!")
                    # self.infer_btn.draw()
            self.last_start_btn_status = new_status

    def update_ia_btn_status(self, name=None, index=None, mode=None) -> None:
        r = n532.fpga_ip_to_num(self.lb_address.get())
        r = bool(r)
        if r != self.last_ia_btn_status:
            self.change_ia_btn_mode(r, True)
            self.lb_got = r
        self.last_ia_btn_status = r

    def put_gui_inference_img(self, img) -> None:
        img2 = Pil_ImageTk.PhotoImage(img)
        self.infer_input_img_label.configure(image=img2)
        self.infer_input_img_label.image = img2

    def put_gui_output_img(self, num: int) -> None:
        self.infer_output_img_label.configure(image=self.num_imgs[num])

    def configure_image_list(self):
        mnist_image_regex = "[0-9]-*.jpg"
        image_path_list = glob.glob(self.directory.get() + "/" + mnist_image_regex)
        self.file_count.set(f"Working...")
        self.root.update_idletasks()

        def image_loader_worker(image_path_list) -> list:
            local = threading.local()
            local.image_list = []
            if len(image_path_list):
                if self.quit_event.isSet():
                    return []
                for local.image_path in image_path_list:
                    local.image_nn = load_and_shape_image_for_nn(local.image_path)
                    local.image_label = int(os.path.basename(local.image_path)[0])
                    local.image_gui = reshape_nn_img_for_gui(local.image_nn)
                    local.image_data_dict = {"nn": local.image_nn, "gui": local.image_gui, "path": local.image_path, "label": local.image_label}
                    local.image_list.append(local.image_data_dict)
            return local.image_list

        with cf.ThreadPoolExecutor() as pool:
            n = 500
            futures = [pool.submit(image_loader_worker, image_path_list[i * n: (i + 1) * n])
                       for i in range(len(image_path_list) // n + 1)]
            futures = [f.result() for f in futures]
            self.image_list = []
            for x in futures:
                self.image_list += x

        if self.image_list:
            self.file_count.set(f"{len(self.image_list)} Images Found")
            self.put_gui_inference_img(self.image_list[0]['gui'])
        else:
            self.file_count.set(f"No Images Found")
        self.build_piece_map()
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
