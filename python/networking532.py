import scapy.all as scapy
from netifaces import interfaces, ifaddresses, AF_INET
import os
import threading

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
    pkt = scapy.Ether(dst=f"00:0a:35:00:00:{ia_ip.split('.')[2]}") / pkt / scapy.Raw(imgdata)
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
    pkt = scapy.Ether(dst=f"00:0a:35:00:00:{ia_ip.split('.')[2]}") / pkt
    pkt = pkt / scapy.UDP(sport=69, dport=666)
    pkt = pkt / scapy.Raw(imgdata)
    pkt.show()
    # send and receive
    res = scapy.srp1(pkt, iface=fpganet['ifname'])
    # print result
    res.show()
    pass


def send_actual_pkt_hardcore(pkt, iface):
    print("sending!")
    scapy.sendp(pkt, iface=iface)


def send_inference_packet_hardcore(fpganet, ia_ip, imgdata):
    pkt = scapy.IP(dst=ia_ip)
    # use Quinn's packet fields
    pkt.id = 0
    pkt.ttl = 0x80
    # load data
    pkt = scapy.Ether(dst=f"00:0a:35:00:00:{ia_ip.split('.')[2]}") / pkt
    pkt = pkt / scapy.UDP(sport=4000, dport=666)
    pkt = pkt / scapy.Raw(imgdata)
    #pkt.show()
    # start async sniff and send
    res = []
    cb = lambda: send_actual_pkt_hardcore(pkt, fpganet['ifname'])
    s = scapy.AsyncSniffer(iface=fpganet['ifname'], count=1, filter="udp src port 666", prn=lambda x: res.append(x),
                           started_callback=cb)
    s.start()
    while (len(res) < 1):
        pass
    #print(len(res))
    try:
        s.stop()
    except scapy.Scapy_Exception:
        pass
    # print result
    # res[0].show()
    byte_list = list(res[0].getlayer(scapy.Raw).load)
    return [byte_list[0], byte_list[1]]


# sniff(iface="ASIX AX88772 USB2.0 to Fast Ethernet Adapter", filter="ether[0:4] = 0x000a3500 or ether [6:4] = 0x000a3500", prn=lambda x: x.show())
# sniff(iface="ASIX AX88772 USB2.0 to Fast Ethernet Adapter", filter="ether host 00:0a:35:00:00:XX", prn=lambda x: x.show())
# sniff(iface="ASIX AX88772 USB2.0 to Fast Ethernet Adapter", filter="ether host 00:0a:35:00:00:09", prn=lambda x: x.show())
