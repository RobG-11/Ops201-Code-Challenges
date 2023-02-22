# Script: 12 - Ops Challenge - Powershell IP Analysis
# Author: Robert Gregor
# Date of latest revision: 212122FFEB23
# Purpose:
    # Create a Powershell script that performs the following operations:
        # Create a local file called network_report.txt that holds the contents of an ipconfig /all command
        # Use Select-String to search network_report.txt and return only the IP version 4 address
        # Remove the network_report.txt when you are finished searching it.
        # For this challenge, you must use at least one variable and one function.
    # Stretch Goals (Optional Objectives)
        # Instead of creating network_report.txt, use piping to store the output in memory and search it there
        # Have your script test whether the network adapter is sending and receiving packets correctly
        # Have your script test connectivity to the internet

# Code Fellows Sources:
    # [Powershell-SysAdmin] (https://github.com/superswan/Powershell-SysAdmin)
# My Sources:
    # [Out-String] (https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/out-string?view=powershell-7.3)
    # [Select-String] (https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/select-string?view=powershell-7.3)
    # [Test-Connection] (https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.management/test-connection?view=powershell-7.3)

# Main

clear

function Get-IP {
    $ipVersionReq = Read-Host "Please enter which IP verion you would like displayed 1) IPv4 or 2) IPv6?"
    if ($ipVersionReq = "1") {
        ipconfig /all | Select-String "IPv4" | Select-Object -First 1 | Write-Output
    } elseif ($ipVersionReq = "2") {
        ipconfig /all | Select-String "IPv6" | Select-Object -First 1 | Write-Output
    } else {
        Write-Host "Invalid Input!"
    }
    Write-Host "Press any key to continue..."
    $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
}

# function Get-TestNetAdpConnect {
#     Test-Connection - 
# }

Get-IP

# Get-TestNetAdpConnect

# End