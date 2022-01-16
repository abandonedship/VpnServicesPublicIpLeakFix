# VpnServicesPublicIpLeakFix
* Linux OS  
    vpnservices-LinuxOS-public-ip-leak-fix.sh  
    bash vpnservices-LinuxOS-public-ip-leak-fix.sh  

* Windows OS batch file  
    vpnservices-WindowsOS-public-ip-leak-fix.bat  
    Just double click in the bat file or open cmd and run vpnservices-WindowsOS-public-ip-leak-fix.bat

* Windows OS powershell file  
    vpnservices-WindowsOS-public-ip-leak-fix.ps1  
    powershell -ExecutionPolicy Bypass -f vpnservices-WindowsOS-public-ip-leak-fix.ps1    


# Detailed Info

Internet Protocol version 6 (IPv6) is the most recent version of the Internet Protocol (IP), the communications protocol  
that provides an identification and location system for computers on networks and routes traffic across the Internet.  
It was developed in 1998 to replace the IPv4 protocol.

IPv6 aims to improve security and performance, while also making sure we don’t run out of addresses. It assigns unique addresses globally to every device  
storing them in 128-bits, compared to just 32-bits used by IPv4.  

Although the goal is for IPv4 to be replaced by IPv6, there is still a long way to go. Less than 30% of the sites  
on the Internet makes IPv6 connectivity available to users (tracked by Google). IPv6 can also cause problems with some applications at time.
Since VPNs provide global services, the fact that IPv6 uses globally routed addresses (uniquely assigned) and that there (still)  
are ISPs that don’t offer IPv6 support shifts this feature lower down their priority list. This way, they can focus on what matters the most for VPN users: security.
Another possible reason you might want to disable IPv6 on your system is not wanting to expose yourself to various threats.  
Although IPv6 itself is safer than IPv4, the risks I am referring to are of another nature. If you aren’t actively using IPv6 and  
its features, having IPv6 enabled leaves you vulnerable to various attacks, offering the hacker another possible exploitable tool.
On the same note, configuring basic network rules is not enough. You have to pay the same level of attention to tweaking  
your IPv6 configuration as you do for IPv4. This can prove to be quite a hassle to do (and also to maintain).  
With IPv6 comes a suite of problems different to those of IPv4 (many of which can be referenced online, given the age of this protocol)  
giving your system another layer of complexity.  
