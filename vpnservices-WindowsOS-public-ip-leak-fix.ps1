
function DisableIpv6(){
    
    Get-NetAdapterBinding -ComponentID ms_tcpip6

    echo "" '--all           (Disable All interfaces)'
    $choice = Read-Host 'Select option: '

    if  ($choice -eq '--all'){

        Start-Process powershell -Verb runAs 'Disable-NetAdapterBinding -Name "*" -ComponentID ms_tcpip6'
    }
       
}

DisableIpv6
