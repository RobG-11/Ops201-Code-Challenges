# Script: 11 - Automated Endpoint Configuration
# Author: Robert Gregor
# Date of latest revision: 201422FFEB23
# Purpose:
    # Write a Powershell script that automates the configuration of a new Windows 10 endpoint
    # Test and validate script achieves desired outcome for each listed objective
        # Put screenshots and discussion of your testing into a Google Doc
    # Your script should perform the following:
        # Enable File and Printer Sharing
        # Allow ICMP traffic
        # Enable Remote management
        # Remove bloatware
        # Enable Hyper-V
        # Disable SMBv1, insecure protocol
# Code Fellows Sources:
    # [Powershell-SysAdmin] (https://github.com/superswan/Powershell-SysAdmin)
# My Sources:
    # [How to Enable or Disable File and Printer Sharing in Windows 10] (https://www.c-sharpcorner.com/article/how-to-enable-or-disable-file-and-printer-sharing-in-windows-102/)
    # [How to allow Windows 10 ping through firewall- GUI, PowerShell netsh command] (https://www.how2shout.com/how-to/allow-windows-10-ping-through-firewall-gui-powershell-netsh-command.html)
    # [Enable-PSRemoting] (https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/enable-psremoting?view=powershell-7.3)
    # [How to Remove Windows 10 Bloatware] (https://winbuzzer.com/2020/06/16/how-to-remove-windows-10s-built-in-apps-bloatware-and-and-restore-them-again-xcxwbt/)
    # [How to enable Hyper-V on Windows 10] (https://www.onmsft.com/how-to/enable-hyper-v-on-windows-10/)
    # [How to Disable/Enable SMB v 1.0 in Windows 10/Server 2016?] (https://woshub.com/how-to-disable-smb-1-0-in-windows-10-server-2016/)

# Main

function Get-EnableSharing {
    netsh advfirewall firewall set rule group="File and Printer Sharing" new enable=Yes
}

function Get-AllowICMPtraffic {
    netsh advfirewall firewall add rule name="ICMP Allow incoming V4 echo request" protocol=icmpv4:8,any dir=in action=allow
}

function Get-EnableRemMgmt {
    Enable-PSRemoting -Force
}

function Get-RemoveBloatware {
    Get-AppxPackage * | Remove-AppxPackage
}

function Get-EnableHyperV {
    Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All
}

function Get-DisableSMBv1 {
    Set-SmbServerConfiguration -EnableSMB1Protocol $false -Force
}

Get-EnableSharing
Write-Host "File & Printer Sharing ENABLED, press any key to continue..."
$Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

Get-AllowICMPtraffic
Write-Host "ICMP Traffic ALLOWED, press any key to continue..."
$Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

Get-EnableRemMgmt
Write-Host "Remote Management ENABLED, press any key to continue..."
$Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

Get-RemoveBloatware
Write-Host "Bloatware REMOVED, press any key to continue..."
$Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

Get-EnableHyperV
Write-Host "Hyper-V ENABLED, press any key to continue..."
$Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

Get-DisableSMBv1
Write-Host "SMBv1 DISABLED, Press any key to exit..."
$Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

powershell -noexit

# End