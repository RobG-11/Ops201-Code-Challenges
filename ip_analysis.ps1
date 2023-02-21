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
    # 

# Main

clear

$ipconfigAll = ipconfig /all | Out-String

function Get-ReturnIPv4 {
    $ipconfigAll | Select-String -Pattern 'ipv4'
}

# End