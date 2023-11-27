📧 Ubuntu Email Configuration Script
This script is designed to simplify the setup of email-related services on your Ubuntu system. It's an adaptation inspired by Derek Sivers' script. Let's get your email up and running effortlessly!

🚀 Quick Start
Run as Root:

bash
Copy code
sudo ./ubuntu_email_config.sh
Follow the Prompts:

Enter the required information as prompted.
Sit Back and Relax:

The script will handle the initial setup, download essential configuration files, and guide you through the setup.
Reboot:

Once done, reboot your system to apply the changes.
🧰 Prerequisites
Ubuntu system
Root access (sudo privileges)
📥 Configuration Files
The script will download the following configuration files:

httpd.conf: HTTP server configuration
relayd.conf: Relay daemon configuration
acme-client.conf: ACME client configuration for Let's Encrypt
.muttrc: Mutt email client configuration
.mailcap: Mailcap configuration for MIME types
dovecot.conf: Dovecot IMAP and POP3 server configuration
Note: If pf.conf is found, it will be moved to /etc/pf.conf, which may not be relevant for Ubuntu.

🌐 Domain Setup
Domain Name:

Enter your domain name when prompted.
Username:

Provide a lowercase username with no spaces.
Verify Email and Login:

Confirm that the displayed email and login details are correct.
🔧 Additional Configurations
The script also configures:

ufw firewall to allow SSH, HTTP, and HTTPS traffic.
🎉 Completion
Congratulations! 🎊 Your email setup is now complete. Reboot your system, and you're good to go!

Acknowledgment:
Special thanks to Derek Sivers for the inspiration. Check out Derek Sivers' website for more insights.

Feel free to reach out if you encounter any issues. Happy emailing! 📬✨
