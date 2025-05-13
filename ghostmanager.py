#!/usr/bin/env python3

# File: ghostmanager.py

import os
import subprocess
import time

def get_mac(interface="eth0"):
    output = subprocess.check_output(["cat", f"/sys/class/net/{interface}/address"])
    return output.decode().strip()

def get_ip():
    result = subprocess.getoutput("curl -s https://api.ipify.org")
    return result

def status_report():
    print("[*] Gathering GhostRoute Status...\n")
    print(f"[+] MAC Address: {get_mac()}")
    print(f"[+] Public IP: {get_ip()}")
    print("[+] Status: Ghosted (manual check advised for leaks)")

if __name__ == "__main__":
    status_report()
