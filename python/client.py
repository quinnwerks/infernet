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
1)  client.py [i]
    interactively set up client process, run interactively.
    not planned until UI integration

2)  client.py i <ur_conf>.conf
    load saved configuration state to skip setup steps, run interactively.
    not planned until UI integration

3)  client.py once <ur_conf>.conf <image file>
    use configuration to do an inference request and exit.
    not implemented yet

4)  client.py lb <lb IP addr>
    query load balancer and exit.
    not implemented yet

5)  client.py lb <lb IP addr> <image file>
    query load balancer and use result to do inference request, and exit.
    not implemented yet

6)  client.py ia <IA IP addr> <image file>
    skip the load balancer and do an inference request to specified accelerator, and exit.
    half implemented
"""

# constants
NN_INPUT_W = 28
NN_INPUT_H = 28


def file_exists(path):
    try:
        open(path, 'r')
    except OSError:
        return False
    return True


def do_inference(fpganet, ia_ip, imgpath):
    assert scapy.valid_ip(ia_ip), f"IA IP address malformed: {ia_ip}"
    assert file_exists(imgpath), f"Image file not accessible: {imgpath}"
    # load image
    img = Image.open(imgpath)
    img = ImageOps.grayscale(img)
    if NN_INPUT_W < img.width or NN_INPUT_H < img.height:
        img = img.resize((NN_INPUT_W, NN_INPUT_H), Image.BILINEAR)
    elif NN_INPUT_W == img.wifth or NN_INPUT_H == img.height:
        pass
    else:
        img = img.resize((NN_INPUT_W, NN_INPUT_H), Image.BICUBIC)
    # send packet
    res = n532.send_inference_packet(fpganet, ia_ip, img.tobytes())
    # TODO: parse result
    pass


def exit_invalid_args():
    print(f"{helptxt}\nInvoked with improper arguments. Exiting...")
    exit(-1)


def main():
    fpganet = n532.get_fpganet()

    if len(sys.argv) == 1:
        pass
    elif len(sys.argv) == 2:
        pass
    elif len(sys.argv) == 3:
        pass
    elif len(sys.argv) == 4:
        if sys.argv[1] == 'ia':
            do_inference(fpganet, sys.argv[2], sys.argv[3])
        else:
            exit_invalid_args()
    else:
        exit_invalid_args()

    print(sys.argv)


if __name__ == '__main__':
    main()
