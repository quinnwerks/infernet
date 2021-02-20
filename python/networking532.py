import scapy.all as scapy
from netifaces import interfaces, ifaddresses, AF_INET
import os

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
                print(f"\nFPGAnet detected! Using interface: {fpganet}")
                if os.name == 'nt':
                    ret['ifname'] = scapy.IFACES[ret['ifname']]
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


def send_inference_packet(fpganet, ia_ip, imgdata):
    pkt = scapy.IP(dst = ia_ip)
    # TODO: use Quinn's packet fields
    pass
    pkt = pkt / scapy.Raw(imgdata)
    print(pkt.show())
    print(fpganet['ifname'])
    scapy.send(pkt, iface=fpganet['ifname'])
    # TODO: receive result
    pass
