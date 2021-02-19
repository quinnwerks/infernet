#!python
# targeting 3.7.2

"""
usage:
1)  lb.py
    interactively set up load balancer process
2)  lb.py configuration.conf
    load saved configuration state to skip setup steps
"""

import networking532 as n532
import sys
import scapy.all as scapy


def main():
    fpganet = n532.get_fpganet()
    print(f"using interface: {fpganet}")
    print()

    print(sys.argv)
    packet = scapy.IP(dst="10.11.12.13", src=fpganet['ipaddr'])/scapy.Raw([1, 2, 3])
    packet.show()


if __name__ == '__main__':
    main()

