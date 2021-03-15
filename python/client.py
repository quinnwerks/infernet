#!python
# targeting 3.7.2

import networking532 as n532
import sys
import scapy.all as scapy
import matplotlib.image as mpimg
import PIL.Image as Image
import PIL.ImageOps as ImageOps
import socket
import re
from typing import Union
import concurrent.futures as cf


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
    return res
    pass


def scan_for_lb_thread(fpganet, ip) -> Union[str, None]:
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
        s.settimeout(0.1)
        try:
            s.connect((ip, n532.LB_TCP_PORT))
            s.sendall(n532.CLIENT_DONE_STR)
            data = s.recv(1024)
            if n532.LB_MALFORMED_STR in data:
                return ip
            else:
                return None
        except socket.timeout:
            return None


def scan_for_lb(fpganet) -> Union[str, None]:
    with cf.ThreadPoolExecutor(max_workers=len(n532.FPGA_IP_SET)) as pool:
        futures = {pool.submit(scan_for_lb_thread, fpganet, ip) for ip in n532.FPGA_IP_SET}
        futures = {f.result() for f in futures}
        ips = {ip for ip in futures if ip}
        if(ips):
            return ips.pop()
        else:
            return None


def get_ia_from_lb(fpganet, lb_ip) -> Union[str, None]:
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
        s.connect((lb_ip, n532.LB_TCP_PORT))
        s.sendall(n532.CLIENT_REQ_STR)
        res = s.recv(1024)
        r = re.search(r'1\.1\.\d{1,2}\.2', str(res))
        if r:
            ip = r.group()
            return ip
        else:
            return None


def return_ia_to_lb(fpganet, lb_ip, ia_ip) -> bool:
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
        s.connect((lb_ip, n532.LB_TCP_PORT))
        s.sendall(n532.CLIENT_DONE_STR + bytes(ia_ip, "utf8"))
        res = s.recv(1024)
        if n532.LB_RETURNED_STR in res:
            return True
        elif n532.LB_NOT_EXIST_STR in res:
            return False
        elif n532.LB_MALFORMED_STR in res:
            return False
        else:
            raise RuntimeError('load balancer returned garbage')


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

    # print(sys.argv)


if __name__ == '__main__':
    main()
