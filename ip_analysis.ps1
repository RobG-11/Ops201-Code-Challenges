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
    # [Test-NetConnection] (https://learn.microsoft.com/en-us/powershell/module/nettcpip/test-netconnection?view=windowsserver2022-ps)
    # [Get-NetIPConfiguration] (https://learn.microsoft.com/en-us/powershell/module/nettcpip/get-netipconfiguration?view=windowsserver2022-ps)
    # [about_While] (https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_while?view=powershell-7.3)

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
    Write-Host ""
    Write-Host "Press any key to continue..."
    $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
}

Get-IP

# End

# Code beneath is experimental

function Get-IP {
    Write-Host "Below is your IPv4 address..."
    Write-Host ""
    ipconfig /all | Select-String "IPv4" | Select-Object -First 1 | Write-Output
    Write-Host ""
    Write-Host "Press any key to continue..."
    $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
}

function Get-TestNetAdpConnect {
    Write-Host "Testing Network Adapter connectivity..."
    Write-Host ""
    $ipConfigAll = ipconfig /all
    $DefaultGateway = $ipconfig | Select-String "Default Gateway"
    $DefaultGatewayIP = ($DefaultGateway -split " ")[-1]
    Test-NetConnection "$DefaultGatewayIP"
    Write-Host ""
    Write-Host "Press any key to continue..."
    $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
}

function Get-TestIntConnect {
    Write-Host "Testing internet connectivity..."
    Write-Host ""
    Test-NetConnection -ComputerName www.codefellows.org -Port 80
    Write-Host ""
    Write-Host "Press any key to continue..."
    $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
}

while($true) {
    Write-Host "1) Current IPv4 Address"
    Write-Host "2) Network Adapter connectivity status"
    Write-Host "3) Internet connectivity status"
    Write-Host "4) Exit"
    $Selection = Read-Host "Please make a selection..."

    if ($Selection -eq 1) {
    Get-IP
    } elseif ($Selection -eq 2) {
    Get-TestNetAdpConnect
    } elseif ($Selection -eq 3) {
    Get-TestIntConnect
    } elseif ($Selection -eq 4) {
    exit
    } else {
    Write-Host "Invalid Input!"
    }
}

# End