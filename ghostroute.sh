#!/bin/bash

# File: ghostroute.sh

iface="eth0"  # Customize or dynamically detect

echo "[*] Spoofing MAC address on $iface"
ip link set $iface down
mac=$(openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/:$//')
ip link set $iface address $mac
ip link set $iface up
echo "[+] New MAC: $mac"

echo "[*] Restarting networking to force new DHCP lease..."
dhclient -r $iface
dhclient $iface

echo "[*] Flushing DNS..."
systemd-resolve --flush-caches

echo "[+] Ghost mode activated."
