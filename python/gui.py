#!python
# targeting 3.7.2
"""
Infernet GUI module.
Built on top of networking utilities.
"""
import tkinter as tk
from PIL import Image as Pil_Image, ImageTk as Pil_ImageTk
import PIL.ImageOps as Pil_ImageOps
import logging
import glob
import time

import networking532 as n532

NN_INPUT_W = 28
NN_INPUT_H = 28

GUI_IMG_INPUT_W = 280
GUI_IMG_INPUT_H = 280

FONT_LABELS = ('calibre', 10, 'bold')
FONT_ENTRIES = ('calibre', 10, 'normal')

class Infernet_GUI:
    """
    """
    def __init__(self):
        self.root = tk.Tk()
        self.root.title("Infernet")
        self.root.geometry("1000x700")

        self.title_image = Pil_ImageTk.PhotoImage(Pil_Image.open("doom_title.png"))
        self.placeholder_sent_image = Pil_ImageTk.PhotoImage(
            self.reshape_nn_img_for_gui(self.load_and_shape_image_for_nn("devil.jpg")))
        
        self.lb_address = tk.StringVar()
        self.lb_port = tk.StringVar()
        self.directory = tk.StringVar()
        self.system_status = tk.StringVar()
        self.system_status.set("IDLE")
        self.image_list = []

        self.title_frame = self.build_title(self.root)
        self.user_entry_frame = self.build_user_entry(self.root)
        self.sent_img_canvas, self.sent_img_id = self.build_sent_image_display(self.root, 
                                                                               self.placeholder_sent_image)
        self.status_bar = self.build_status_bar(self.root, self.system_status)
        self.infer_panel = self.build_infer_button_panel(self.root)
        
        self.title_frame.pack()
        self.user_entry_frame.pack()
        self.sent_img_canvas.pack()
        self.status_bar.pack()
        self.infer_panel.pack()



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
            log.info("User entered bad inputs", err_msg)
            self.system_status.set(err_msg)
            return
        
        image_path_list = glob.glob("*.jpg")
        if image_path_list is []:
            log.info("No images found in directory " + directory)
            self.system_status.set("No Images Found")
            
            
        self.system_status.set("CONTACTING LB")
        # TODO interface with LB
        ia_ip = "1.1.2.2"
        ia_port = 666 # Unused for now, might want to make sent_pkt stuff generic
        fpganet = n532.get_fpganet()
        
        self.configure_image_list(image_path_list)
        
        curr_img = 0
        for image_dict in self.image_list:
            image_nn = image_dict["nn"]
            image_gui = image_dict["gui"]
            logging.info(image_dict["path"])
            
            # Update GUI before inference
            self.system_status.set("INFERING (%d/%d)" % (curr_img+1, len(self.image_list)))
            self.sent_img_canvas.itemconfig(self.sent_img_id, image=image_gui)  
            self.sent_img_canvas.update_idletasks()
            
            # Do inference, get result
            encoded_result = n532.send_inference_packet_hardcore(fpganet, ia_ip, image_nn.tobytes())
            decoded_result = self.decode_result(encoded_result)
            logging.info("Result is " + str(decoded_result))
            
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
            image_data_dict = {"nn":image_nn, "gui":image_gui, "path":image_path}
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
        lb_address_label = tk.Label(user_entry_frame, text="Load Balacer IP", font=FONT_LABELS)
        lb_port_label = tk.Label(user_entry_frame, text="Load Balacer Port", font=FONT_LABELS)
        directory_label = tk.Label(user_entry_frame, text="Batch Directory", font=FONT_LABELS)

        lb_address_entry = tk.Entry(user_entry_frame,
                                    textvariable=self.lb_address,
                                    font=FONT_ENTRIES)

        lb_port_entry = tk.Entry(user_entry_frame,
                                 textvariable=self.lb_port,
                                 font=FONT_ENTRIES)

        directory_entry = tk.Entry(user_entry_frame,
                                   textvariable=self.directory,
                                   font=FONT_ENTRIES)


        lb_address_label.grid(row=0, column=0)
        lb_port_label.grid(row=0, column=2)
        directory_label.grid(row=0, column=4)

        lb_address_entry.grid(row=0, column=1)
        lb_port_entry.grid(row=0, column=3)
        directory_entry.grid(row=0, column=5)

        return user_entry_frame
    
    def build_metrics_bar(self):
        pass
        
    def build_sent_image_display(self, root, initial_image):
        sent_image_label = tk.Label()
        canvas = tk.Canvas(root, width = GUI_IMG_INPUT_W, height=GUI_IMG_INPUT_H)
        image_id = canvas.create_image(0, 
                                       0, 
                                       anchor="nw", 
                                       image=initial_image)
        return canvas, image_id
        
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
