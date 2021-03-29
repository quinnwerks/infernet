import scapy.all as scapy
from netifaces import interfaces, ifaddresses, AF_INET
import os
import re
from typing import Union
import time


def fpganet_num_to_ip(i):
    return f"1.1.{i}.2"


def fpga_ip_to_num(ip: str) -> Union[None, int]:
    r = re.search(r'^1\.1\.(\d{1,2})\.2$', ip)
    if not r:
        return None
    if int(r.group(1)) not in FPGA_NUM_SET:
        return None
    return int(r.group(1))


def fpganet_num_to_mac(i):
    return f"00:0a:35:00:00:{i}"


FPGA_NUM_SET = set(range(1, 12+1))  # | set(range(19, 30+1))
FPGA_IP_SET = {fpganet_num_to_ip(i) for i in FPGA_NUM_SET}
FPGA_MAC_SET = {fpganet_num_to_mac(i) for i in FPGA_NUM_SET}
CLIENT_UDP_PORT = 4000
IA_UDP_PORT = 666
LB_UDP_PORT = 6666
LB_TCP_PORT = 8080
CLIENT_REQ_STR = b'i can has cheezburger'
CLIENT_DONE_STR = b'put it back'
LB_UNAVAILABLE_STR = b'gone reduced to atoms'
LB_NOT_EXIST_STR = b'the salami lid wont fit'
LB_RETURNED_STR = b'thanks for the fish'
LB_MALFORMED_STR = b'it hurts when IP'


def get_interfaces():
    availableIfaces = []
    for ifaceName in interfaces():
        addresses = [i['addr'] for i in ifaddresses(ifaceName).setdefault(AF_INET, [{'addr': 'No IP addr'}])]
        # print('%s: %s' % (ifaceName, ', '.join(addresses)))
        availableIfaces.append((ifaceName, addresses))
    return availableIfaces
    # print(availableIfaces)


def find_fpganet_if(ifaces):
    ret = False
    for interface in ifaces:
        for ip in interface[1]:
            if(ip.startswith('1.1.')):
                ret = {'ifname': interface[0], 'ipaddr': ip}
                if os.name == 'nt':
                    ret['ifname'] = scapy.IFACES[ret['ifname']]
                print(f"\nFPGAnet detected! Using interface: {ret}\n")
                return ret


def prompt_alternative_if(ifaces):
    prompt = ''
    for i in range(len(ifaces)):
        # prompt += '%d:\t%s \t(%s)\n' % (i, ifaces[i][0], ifaces[i][1][0])
        prompt += f'\n{i}:\t{ifaces[i][0]} \t({ifaces[i][1][0]})'
    print("\nFPGANet interface not detected, please choose network interface:")
    print(prompt)
    num = None
    while (not isinstance(num, int) or num < 0 or num >= len(ifaces)):
        try:
            num = int(input("\nEnter a number: "))
        except ValueError:
            num = None
    ret = {'ifname': ifaces[num][0], 'ipaddr': ifaces[num][1][0]}
    if os.name == 'nt':
        ret['ifname'] = scapy.IFACES[ret['ifname']]
    return ret


def get_fpganet():
    ifaces = get_interfaces()
    fpganet = find_fpganet_if(ifaces)
    if (not fpganet):
        fpganet = prompt_alternative_if(ifaces)
    return fpganet


def send_inference_packet_old(fpganet, ia_ip, imgdata):
    pkt = scapy.IP(dst = ia_ip)
    # use Quinn's packet fields
    pkt.id = 0
    pkt.ttl = 0x80
    # load data
    pkt = scapy.Ether(dst=fpganet_num_to_mac(ia_ip.split('.')[2])) / pkt / scapy.Raw(imgdata)
    pkt.show()
    # print(fpganet['ifname'])
    res = scapy.srp1(pkt, iface=fpganet['ifname'])
    # receive result
    res.show()
    pass


def send_inference_packet(fpganet, ia_ip, imgdata):
    pkt = scapy.IP(dst=ia_ip)
    # use Quinn's packet fields
    pkt.id = 0
    pkt.ttl = 0x80
    # load data
    pkt = scapy.Ether(dst=fpganet_num_to_mac(ia_ip.split('.')[2])) / pkt
    pkt = pkt / scapy.UDP(sport=CLIENT_UDP_PORT, dport=IA_UDP_PORT)
    pkt = pkt / scapy.Raw(imgdata)
    pkt.show()
    # send and receive
    res = scapy.srp1(pkt, iface=fpganet['ifname'])
    # print result
    res.show()
    return res


def send_actual_pkt_hardcore(pkt, iface):
    # print("sending!")
    scapy.sendp(pkt, iface=iface)


def send_inference_packet_hardcore(fpganet, ia_ip, imgdata, timeout=None):
    """
    :param fpganet:
    :param ia_ip:
    :param imgdata:
    :param timeout: async sniffer timeout in seconds, omit or None for no timeout
    :return: the packet captured or None if timed out without capturing
    """
    pkt = scapy.IP(dst=ia_ip)
    # use Quinn's packet fields
    pkt.id = 0
    pkt.ttl = 0x80
    # load data
    pkt = scapy.Ether(dst=fpganet_num_to_mac(ia_ip.split('.')[2])) / pkt
    pkt = pkt / scapy.UDP(sport=CLIENT_UDP_PORT, dport=IA_UDP_PORT)
    pkt = pkt / scapy.Raw(imgdata)
    # pkt.show()
    # start async sniff and send
    # res = []
    s = scapy.AsyncSniffer(iface=fpganet['ifname'],
                           count=1,
                           filter=f"udp src port {IA_UDP_PORT}",
                           # prn=lambda x: res.append(x),
                           started_callback=lambda: send_actual_pkt_hardcore(pkt, fpganet['ifname']),
                           timeout=timeout)
    s.start()
    # while s.running:
    #     time.sleep(0.001)# maybe sleep instead of poll, but that'll be slower
    #     pass
    # time.sleep(0.001) # the millisecond yields thread and give
    s.join()
    # print(len(res))
    # try:
    #     s.stop()
    # except scapy.Scapy_Exception:
    #     pass
    res = s.results
    if len(res):
        res = res[0]
        # res.show()
    else:
        res = None
    if not res:
        return None
    # print result
    byte_list = list(res.getlayer(scapy.Raw).load)
    return (int(byte_list[0] << 8)) | int(byte_list[1])
    # return res


# sniff(iface="ASIX AX88772 USB2.0 to Fast Ethernet Adapter", filter="ether[0:4] = 0x000a3500 or ether [6:4] = 0x000a3500", prn=lambda x: x.show())
# sniff(iface="ASIX AX88772 USB2.0 to Fast Ethernet Adapter", filter="ether host 00:0a:35:00:00:XX", prn=lambda x: x.show())
# sniff(iface="ASIX AX88772 USB2.0 to Fast Ethernet Adapter", filter="ether host 00:0a:35:00:00:09", prn=lambda x: x.show())
# sniff(iface="ASIX AX88772 USB2.0 to Fast Ethernet Adapter", filter="udp port 666", prn=lambda x: x.show())
