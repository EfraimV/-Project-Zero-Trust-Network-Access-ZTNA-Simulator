from pygal import Treemap  # For visualization  

def detect_lateral_movement(pcap_file):  
    """Flags internal IPs scanning multiple subnets"""  
    scanner_ips = set()  
    for packet in pcap:  
        if packet.haslayer(TCP) and packet[TCP].flags == 2:  # SYN scan  
            if packet[IP].src in internal_subnets:  
                scanner_ips.add(packet[IP].src)  
    return scanner_ips  
