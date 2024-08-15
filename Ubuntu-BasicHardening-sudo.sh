#!/bin/bash
# -----------------------------------------------------------------------------
# Ubuntu - Basic Hardening - sudo
# Tested on Ubuntu 22.04 LTS - Ubuntu 24.04 LTS
# Install & Setup: User Account, OpenSSH, UFW, Fail2Ban, Security Update
# Made under a rainbow by nextproject.sh
# -----------------------------------------------------------------------------

# Update and upgrade packages
sudo apt update
sudo apt upgrade -y

# Disable root login and enforce key-based authentication
sudo sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
sudo sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
echo AllowUsers user1 | sudo tee -a /etc/ssh/sshd_config

# Configure secure SSH cipher settings
echo "Ciphers chacha20-poly1305@openssh.com,aes256-gcm@openssh.com,aes128-gcm@openssh.com,aes256-ctr,aes192-ctr,aes128-ctr" | sudo tee -a /etc/ssh/sshd_config
echo "KexAlgorithms curve25519-sha256@libssh.org,diffie-hellman-group-exchange-sha256" | sudo tee -a /etc/ssh/sshd_config
service ssh restart

# Install UFW, Enable firewall (ufw) & allow OpenSSH
sudo apt install -y ufw
sudo ufw allow OpenSSH
sudo yes | sudo ufw enable

# Install and configure fail2ban to prevent brute-force attacks
sudo apt install -y fail2ban
sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
sudo systemctl enable fail2ban
sudo systemctl start fail2ban

# Set up automatic security updates
sudo apt install -y unattended-upgrades
sudo dpkg-reconfigure -plow unattended-upgrades