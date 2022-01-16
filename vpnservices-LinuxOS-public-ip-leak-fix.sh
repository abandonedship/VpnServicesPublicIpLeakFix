#!/bin/bash

### VPN services LEAKS your REAL public ip address if you have ipv6 enabled in your systems
### ALL OS are affected by this critical issue
### this script disable ipv6 modules in /etc/sysctl.conf and /etc/default/grub files


cat <<EOF

            +++++++++++++++++++++++++++++++++++++++++++++++
            + FIX TO VPN SERVICES PUBLIC IP ADDRESS LEAKS +
            +++++++++++++++++++++++++++++++++++++++++++++++

Since VPNs provide global services, the fact that IPv6 uses globally routed addresses (uniquely assigned)
and that there (still) are ISPs that don’t offer IPv6 support shifts this feature lower down their priority list.
This way, they can focus on what matters the most for VPN users: security.
Another possible reason you might want to disable IPv6 on your system is not wanting to expose yourself to various threats.
Although IPv6 itself is safer than IPv4, the risks I am referring to are of another nature.
If you aren’t actively using IPv6 and its features, having IPv6 enabled leaves you vulnerable to various attacks, offering
the hacker another possible exploitable tool.
stem another layer of complexity.

EOF


########### PROGRAM ######################

if [ $(id -u) != "0" ];
then
	printf "Run me as root\n"
	exit
fi


printf "[\e[0;32m+\e[0m] Upgrading /etc/sysctl.conf file\n"

### Beginning of /etc/sysctl.conf file

cat <<EOF > /etc/sysctl.conf
#
# /etc/sysctl.conf - Configuration file for setting system variables
# See /etc/sysctl.d/ for additional system variables.
# See sysctl.conf (5) for information.
#

#kernel.domainname = example.com

# Uncomment the following to stop low-level messages on console
#kernel.printk = 3 4 1 3

##############################################################3
# Functions previously found in netbase
#

# Uncomment the next two lines to enable Spoof protection (reverse-path filter)
# Turn on Source Address Verification in all interfaces to
# prevent some spoofing attacks
#net.ipv4.conf.default.rp_filter=1
#net.ipv4.conf.all.rp_filter=1

# Uncomment the next line to enable TCP/IP SYN cookies
# See http://lwn.net/Articles/277146/
# Note: This may impact IPv6 TCP sessions too
#net.ipv4.tcp_syncookies=1

# Uncomment the next line to enable packet forwarding for IPv4
#net.ipv4.ip_forward=1

# Uncomment the next line to enable packet forwarding for IPv6
#  Enabling this option disables Stateless Address Autoconfiguration
#  based on Router Advertisements for this host
#net.ipv6.conf.all.forwarding=1


###################################################################
# Additional settings - these settings can improve the network
# security of the host and prevent against some network attacks
# including spoofing attacks and man in the middle attacks through
# redirection. Some network environments, however, require that these
# settings are disabled so review and enable them as needed.
#
# Do not accept ICMP redirects (prevent MITM attacks)
#net.ipv4.conf.all.accept_redirects = 0
#net.ipv6.conf.all.accept_redirects = 0
# _or_
# Accept ICMP redirects only for gateways listed in our default
# gateway list (enabled by default)
# net.ipv4.conf.all.secure_redirects = 1
#
# Do not send ICMP redirects (we are not a router)
#net.ipv4.conf.all.send_redirects = 0
#
# Do not accept IP source route packets (we are not a router)
#net.ipv4.conf.all.accept_source_route = 0
#net.ipv6.conf.all.accept_source_route = 0
#
# Log Martian Packets
#net.ipv4.conf.all.log_martians = 1
#

###################################################################
# Magic system request Key
# 0=disable, 1=enable all, >1 bitmask of sysrq functions
# See https://www.kernel.org/doc/html/latest/admin-guide/sysrq.html
# for what other values do
#kernel.sysrq=438

net.ipv6.conf.all.disable_ipv6=1
net.ipv6.conf.default.disable_ipv6=1
net.ipv6.conf.lo.disable_ipv6=1

EOF

##### end of /etc/sysctl.conf file


sudo sysctl -p


printf "[\e[0;32m+\e[0m] Upgrading /etc/default/grub file\n"
## Beginning of /etc/default/grub file

sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT=".*/GRUB_CMDLINE_LINUX_DEFAULT="quiet ipv6.disable=1"/g' /etc/default/grub

#### end of /etc/default/grub file


sudo update-grub


printf "[\e[0;32m+\e[0m] Ipv6 is now disabled and VPN services original public ip address leaks are now fixed\n"

cat <<EOF
Reboot your system to apply permanent changes
Then connect with VPN services normally without real public ip address leaks
EOF
