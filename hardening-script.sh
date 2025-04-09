#!/bin/bash

# -------------------------
# 🧱 Kali Linux Hardening Script
# Author: Tymaze3
# Purpose: Secure a Kali Linux VM for homelab use
# -------------------------

echo "🔐 Starting Kali Hardening Script..."

# 1️⃣ Enable UFW and default deny
echo "[+] Enabling UFW firewall..."
sudo apt update && sudo apt install -y ufw
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw enable

# 2️⃣ Disable SSH root login
echo "[+] Disabling root SSH login..."
sudo sed -i 's/^PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
sudo systemctl restart ssh

# 3️⃣ Set password and lockout policy
echo "[+] Configuring password & lockout policies..."

# Password min length
sudo sed -i 's/^PASS_MIN_LEN.*/PASS_MIN_LEN   14/' /etc/login.defs

# Lockout after 5 failed attempts (fail2ban style)
sudo apt install -y libpam-pwquality
echo "auth required pam_faillock.so preauth silent deny=5 unlock_time=900" | sudo tee -a /etc/pam.d/common-auth
echo "auth [success=1 default=ignore] pam_unix.so" | sudo tee -a /etc/pam.d/common-auth
echo "auth [default=die] pam_faillock.so authfail deny=5 unlock_time=900" | sudo tee -a /etc/pam.d/common-auth

# 4️⃣ Harden home folder permissions
echo "[+] Hardening home directory permissions..."
sudo chmod 700 /home/$USER

# 5️⃣ Disable unnecessary services
echo "[+] Disabling unused services..."
SERVICES=("bluetooth" "cups" "avahi-daemon")
for svc in "${SERVICES[@]}"; do
    sudo systemctl disable $svc --now 2>/dev/null && echo "[-] Disabled $svc"
done

# ✅ Done
echo "✅ Hardening complete. Reboot recommended!"
