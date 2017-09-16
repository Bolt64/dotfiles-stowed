#!/usr/bin/python3

"""
A script to get the public ip address from http://checkip.dyndns.org
"""

import urllib.request
import re

def get_public_ip():
    """
    Get public ip address
    """
    ipv4_address_pattern=re.compile(r'[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+')
    ip_addresses=[]
    try:
        with urllib.request.urlopen("http://checkip.dyndns.org") as urlobject:
            ip_addresses=[addr for addr in ipv4_address_pattern.findall(str(urlobject.read()))]
        return ip_addresses
    except ConnectionResetError:
        print('Connection reset by server. Try again')

if __name__=='__main__':
    addresses=get_public_ip()
    try:
        for addr in addresses:
            print(addr)
    except:
        pass
