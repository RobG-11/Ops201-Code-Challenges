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
    # [Show-ControlPanelItem] (https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.management/show-controlpanelitem?view=powershell-5.1)
    # [Win10 - Canonical Names of Control Panel Items] (https://www.reddit.com/r/windows/comments/amy2m1/win10_canonical_names_of_control_panel_items/)
    # [Windows control panel] (https://renenyffenegger.ch/notes/Windows/control-panel/index)
    # [Get-NetFirewallRule] (https://learn.microsoft.com/en-us/powershell/module/netsecurity/get-netfirewallrule?view=windowsserver2022-ps)
    # [How to view installed apps with PowerShell on Windows 10] (https://pureinfotech.com/view-installed-apps-powershell-windows-10/)
    # [How do you check to see if Hyper-V is enabled using PowerShell?] (https://stackoverflow.com/questions/37567596/how-do-you-check-to-see-if-hyper-v-is-enabled-using-powershell)
    # [How to Fix WinRm Firewall Exception Rule When Enabling PS Remoting] (https://www.faqforge.com/powershell/fix-winrm-firewall-exception-rule-enabling-ps-remoting/)
    # [Prompting for User Input with PowerShell] (https://www.itprotoday.com/powershell/prompting-user-input-powershell)


# Main

# NOT COMPLETE TRYING TO ADD FUNCTIONALITY

clear

function Get-AnyKeyToContinue {
    Write-Host "Press any key to continue..."
    $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    clear
}

function Get-EnableSharing {
    clear
    netsh advfirewall firewall set rule group="File and Printer Sharing" new enable=Yes
    Show-ControlPanelItem -CanonicalName Microsoft.NetworkAndSharingCenter
    Write-Host "File and Printer Sharing enabled"
    Write-Host "In Network & Sharing window that opened, click on 'Change advanced sharing settings' to confirm"
    Write-Host ""
    Get-AnyKeyToContinue
}

function Get-AllowICMPtraffic {
    netsh advfirewall firewall add rule name="ICMP Allow incoming V4 echo request" protocol=icmpv4:8,any dir=in action=allow
    Show-ControlPanelItem -CanonicalName Microsoft.WindowsFirewall
    Write-Host "Inbound ICMPv4 Allowed"
    Write-Host "In Windows Defender Firewall window that opened, click on Advance settings -> Inbound Rules"
    Write-Host "Navigate to 'File and Printer Sharing (Echo Request - ICMPv4-In)', confirm green check mark or double click"
    Write-Host ""
    Get-AnyKeyToContinue
}

function Get-EnableRemMgmt {
    Set-WSManQuickConfig -SkipNetworkProfileCheck -ErrorAction SilentlyContinue
    Enable-PSRemoting -Force
    Write-Host ""
    Get-AnyKeyToContinue
}

# WHY DOES THIS FUNCTION WORK FINE OUTSIDE THE PROGRAM BUT PRINTS NO OUTPUT WHEN RUN INSIDE THE PROGRAM !@#!@#$@!#%@!#%@!%#!%#@!%#!%#!% anger

# function Get-RemoveBloatware {
#     DISM /Online /Get-ProvisionedAppxPackages | select-string Packagename
#     Write-Host "Current installed bloatware listed above"
#     $BloatName = Read-Host "Copy and paste package name you would like to remove and press ENTER"

#     DISM /Online /Remove-ProvisionedAppxPackage /PackageName:$BloatName

#     DISM /Online /Get-ProvisionedAppxPackages | select-string Packagename
#     Write-Host "Confirm bloatware has been removed in new bloatware list above"
#     Write-Host ""
#     Get-AnyKeyToContinue
# }

function Get-RemoveBloatware {
    $RemoveBW = Read-Host "Would you like to remove bloatware (Y/N)?"
    if($RemoveBW == "Y") {
        iex ((New-Object System.Net.WebClient).DownloadString('https://git.io/debloat'))
        Write-Host ""
        Write-Host "Bloatware Removed!"
    } else {
        Write-Host ""
        Write-Host "Bloatware not removed"
    }
    Write-Host ""
    Get-AnyKeyToContinue
}

function Get-EnableHyperV {
    Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All 
    Write-Host "To confirm Hyper V is enabled by executing a .State command..."
    Get-AnyKeyToContinue
    $hyperv = Get-WindowsOptionalFeature -FeatureName Microsoft-Hyper-V-All -Online
    if($hyperv.State -eq "Enabled") {
        Write-Host "Hyper-V is enabled"
    } else {
        Write-Host "Hyper-V is disabled"
    }
    Write-Host ""
    Get-AnyKeyToContinue  
}

function Get-DisableSMBv1 {
    Set-SmbServerConfiguration -EnableSMB1Protocol $false -Force
    Write-Host "SMBv1 has been disabled"
    Write-Host "To check if SMBv1 is Disabled press any key to continue..."
    $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    Get-SmbServerConfiguration | Select EnableSMB1Protocol
}

Get-EnableSharing

Get-AllowICMPtraffic

Get-EnableRemMgmt

Get-RemoveBloatware

Get-EnableHyperV

Get-DisableSMBv1

powershell -noexit

# End