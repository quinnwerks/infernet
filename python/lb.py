#!python
# targeting 3.7.2

import networking532 as n532
import sys
import scapy.all as scapy
import matplotlib.image as mpimg
import PIL.Image as Image
import PIL.ImageOps as ImageOps


helptxt = """
usage:
1)  lb.py [i]
    interactively set up client process, run interactively.
    work in progress
"""

# constants
NN_INPUT_W = 28
NN_INPUT_H = 28


def exit_invalid_args():
    print(f"{helptxt}\nInvoked with improper arguments. Exiting...")
    exit(-1)


def scan_for_accelerators(fpganet):
    imgdata = bytearray([0] * NN_INPUT_W * NN_INPUT_H)
    ia_set = set()
    for i in n532.FPGA_NUM_SET:
        res = n532.send_inference_packet_hardcore(fpganet, n532.fpganet_num_to_ip(i), imgdata, 0.01)
        if res and res["IP"].len == 46:
            # res.show()
            ia_set.add(i)
    return ia_set


def start_daemon(fpganet):
    ia_set = scan_for_accelerators(fpganet)
    print(ia_set)
    pass


def main():
    fpganet = n532.get_fpganet()

    if len(sys.argv) == 1:
        start_daemon(fpganet)
        pass
    else:
        exit_invalid_args()


if __name__ == '__main__':
    main()
