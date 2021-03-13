#!python
# targeting 3.7.2

import networking532 as n532
import sys
import socket
import re
import scapy.all as scapy
import matplotlib.image as mpimg
import PIL.Image as Image
import PIL.ImageOps as ImageOps


helptxt = """
usage:
1)  lb.py
    runs the load balance until keyboardInterrupt. Will print statuses to terminal.
    MVP done
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


def start_daemon(fpganet) -> None:
    free_set = scan_for_accelerators(fpganet)
    print(free_set)
    # state = {i: "free" for i in free_set}
    busy_set = set()  # O(n) search is ok for our scale

    # single thread tcp response loop
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
        s.bind((fpganet['ipaddr'], n532.LB_TCP_PORT))
        s.listen()
        while True:
            conn, addr = s.accept()
            with conn:
                print('Connected by', addr)
                data = conn.recv(1024)  # client gets one packet to say its piece
                if n532.CLIENT_REQ_STR in data:
                    if free_set:
                        i = free_set.pop()
                        busy_set.add(i)
                        print(f"leased out accelerator on board {i}")
                        conn.sendall(bytes(n532.fpganet_num_to_ip(i), "utf8"))
                    else:
                        conn.sendall(n532.LB_UNAVAILABLE_STR)
                elif n532.CLIENT_DONE_STR in data:
                    r = re.search(r'1\.1\.(\d{1,2})\.2', str(data))
                    if r:
                        i = int(r.group(1))
                        if i in busy_set:
                            busy_set.remove(i)
                            free_set.add(i)
                            print(f"took back accelerator on board {i}")
                            conn.sendall(n532.LB_RETURNED_STR)
                        else:
                            conn.sendall(n532.LB_NOT_EXIST_STR)
                    else:
                        conn.sendall(n532.LB_MALFORMED_STR)
                else:
                    conn.sendall(n532.LB_MALFORMED_STR)


def main():
    fpganet = n532.get_fpganet()

    if len(sys.argv) == 1:
        start_daemon(fpganet)
        pass
    else:
        exit_invalid_args()


if __name__ == '__main__':
    main()
