# Ubuntu Hardening Scripts

This repository contains two scripts designed to perform basic hardening on an Ubuntu system. The scripts update and upgrade packages, configure SSH for improved security, set up a firewall, install and configure fail2ban, and set up automatic security updates.

## Scripts

### Ubuntu-BasicHardening-sudo.sh

*Use this script if your cloud provider gives you a user with sudo privileges.*

This script performs the following tasks:
1. **Update and Upgrade Packages**: Ensures all installed packages are up-to-date.
2. **Disable Root Login and Enforce Key-Based Authentication**: Enhances SSH security by disabling root login and enforcing key-based authentication.
3. **Configure Secure SSH Cipher Settings**: Strengthens SSH security by specifying strong encryption ciphers and key exchange algorithms.
4. **Install and Enable UFW**: Sets up and enables the uncomplicated firewall (UFW) and allows OpenSSH through the firewall.
5. **Install and Configure fail2ban**: Protects against brute-force attacks by installing and configuring fail2ban.
6. **Set Up Automatic Security Updates**: Ensures the system automatically installs security updates.

### Ubuntu-BasicHardening-root.sh

*Use this script if your cloud provider provides you with the root user.*

This script performs similar tasks to `Ubuntu-BasicHardening-sudo.sh` with additional steps for creating a new user and setting up SSH key-based authentication for the new user. It performs the following tasks:
1. **Update and Upgrade Packages**: Ensures all installed packages are up-to-date.
2. **Create or Update Root Password**: Prompts to create or update the root password.
3. **Add New User**: Adds a new user (requires customization).
4. **Give Sudo Privilege to New User**: Grants sudo privileges to the new user.
5. **Install rsync**: Installs rsync for file synchronization.
6. **Copy SSH Key from Root to New User**: Copies the SSH key from the root user to the new user (requires customization).
7. **Disable Root Login and Enforce Key-Based Authentication**: Enhances SSH security by disabling root login and enforcing key-based authentication.
8. **Configure Secure SSH Cipher Settings**: Strengthens SSH security by specifying strong encryption ciphers and key exchange algorithms.
9. **Install and Enable UFW**: Sets up and enables the uncomplicated firewall (UFW) and allows OpenSSH through the firewall.
10. **Install and Configure fail2ban**: Protects against brute-force attacks by installing and configuring fail2ban.
11. **Set Up Automatic Security Updates**: Ensures the system automatically installs security updates.
