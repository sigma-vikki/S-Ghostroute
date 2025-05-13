#!/bin/bash

echo "[*] Installing dependencies..."
apt update && apt install -y macchanger curl

echo "[+] Done. Run './ghostroute.sh' to begin."
