# 📧 Ubuntu Server Configuration Script

This script simplifies the setup of a secure server with email configuration using an Ubuntu system. It's inspired by [Derek Sivers' script](https://sive.rs/ti) and relies on a refactored version of a script he wrote for OpenBSD operating systems. Let's get your server up and running independently!

## 🚀 Quick Start

1. **Run as Root:**
   ```bash
   sudo ./ubuntu_email_config.sh

## Follow the Prompts:

1. **Enter the required information as prompted.**

## Sit Back and Relax:

- The script will handle the initial setup, download essential configuration files, and guide you through the setup.

## Reboot:

- Once done, reboot your system to apply the changes.

## 🧰 Prerequisites
- Ubuntu system
- Root access (sudo privileges)

## 📥 Configuration Files
The script will download the following configuration files:

1. `httpd.conf`: HTTP server configuration
2. `relayd.conf`: Relay daemon configuration
3. `acme-client.conf`: ACME client configuration for Let's Encrypt
4. `.muttrc`: Mutt email client configuration
5. `.mailcap`: Mailcap configuration for MIME types
6. `dovecot.conf`: Dovecot IMAP and POP3 server configuration

**Note:** If `pf.conf` is found, it will be moved to `/etc/pf.conf`, which may not be relevant for Ubuntu.

## 🌐 Domain Setup
1. **Domain Name:**
   - Enter your domain name when prompted.

2. **Username:**
   - Provide a lowercase username with no spaces.

3. **Verify Email and Login:**
   - Confirm that the displayed email and login details are correct.

## 🔧 Additional Configurations
- The script also configures:
  - `ufw` firewall to allow SSH, HTTP, and HTTPS traffic.

## 🎉 Completion
Congratulations! 🎊 Your email setup is now complete. Reboot your system, and you're good to go!

**Acknowledgment:**
Special thanks to Derek Sivers for this. Check out [Derek Sivers' website](https://sive.rs) for more insights.

Enjoy owning and controlling your own data! 📬✨
