#!/bin/bash
# -----------------------------------------------------------------------------
# Ubuntu - Basic Hardening - root
# Tested on Ubuntu 22.04 LTS - Ubuntu 24.04 LTS
# Install & Setup: User Account, OpenSSH, UFW, Fail2Ban, Security Update
# Made under a rainbow by nextproject.sh
# -----------------------------------------------------------------------------

# Update and upgrade packages
apt update
apt upgrade -y

# Create or update root password
passwd

# Add new user <<<Requires Customization>>>
adduser user1

# Give sudo privilege to new user <<<Requires Customization>>>
usermod -aG sudo user1

# Install rsync
apt install -y rsync

# Copy the SSH key from root to user1 <<<Requires Customization>>>
rsync --archive --chown=user1:user1 ~/.ssh /home/user1

# Disable root login and enforce key-based authentication
sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
echo AllowUsers user1 >> /etc/ssh/sshd_config

# Configure secure SSH cipher settings
echo "Ciphers chacha20-poly1305@openssh.com,aes256-gcm@openssh.com,aes128-gcm@openssh.com,aes256-ctr,aes192-ctr,aes128-ctr" >> /etc/ssh/sshd_config
echo "KexAlgorithms curve25519-sha256@libssh.org,diffie-hellman-group-exchange-sha256" >> /etc/ssh/sshd_config
service ssh restart

# Install UFW, Enable firewall (ufw) & allow OpenSSH
apt install -y ufw
ufw allow OpenSSH
yes | sudo ufw enable

# Install and configure fail2ban to prevent brute-force attacks
apt install -y fail2ban
cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
systemctl enable fail2ban
systemctl start fail2ban

# Set up automatic security updates
apt install -y unattended-upgrades
dpkg-reconfigure -plow unattended-upgrades