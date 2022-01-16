@echo off

echo ###################################################
echo # WINDOWS OS VPN SERVICES REAL PUBLIC IP LEAK FIX #
echo ###################################################

echo [*] Listing Network Interfaces and Ipv6 status

powershell -c Get-NetAdapterBinding -Name "*" -ComponentID ms_tcpip6

echo Options:
echo --all        (Disable All Interfaces)

set /p choice="Select option: "

if %choice% == --all (powershell Start-Process powershell -Verb runAs 'Disable-NetAdapterBinding -Name "*" -ComponentID ms_tcpip6')

