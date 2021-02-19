# targeting 3.7.2
import networking532 as n532
import sys
import scapy.all as scapy
import matplotlib.image as mpimg


def main():
    fpganet = n532.get_fpganet()
    print(f"using interface: {fpganet}")
    print()

    print(sys.argv)
    packet = scapy.IP(dst="10.11.12.13", src=fpganet['ipaddr'])/scapy.Raw([1, 2, 3])
    packet.show()


if __name__ == '__main__':
    main()

