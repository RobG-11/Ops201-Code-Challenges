# Sources:
    # [How to enable Remote Desktop from PowerShell on Windows 10] (https://pureinfotech.com/enable-remote-desktop-powershell-windows-10/)
    # [Create a User Account in Windows 10 with PowerShell] (https://winaero.com/create-user-account-windows-10-powershell/)
    # [Get-Date] (https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/get-date?view=powershell-7.3)
    # [How to enable execution of PowerShell scripts?] (https://superuser.com/questions/106360/how-to-enable-execution-of-powershell-scripts)
    # [add "Remote Desktop User" powershell] (https://learn.microsoft.com/en-us/answers/questions/728543/add-remote-desktop-user-powershell)
    # 

# Main

# Function takes user full name & username as input, creates user with no current password, prints new user into to screen to verify

function Get-NewUser {
    $user_full_name = Read-Host "Please enter new users full name"
    $user_name = Read-Host "Please enter new users USERNAME"
    $password = Read-Host -AsSecureString "Please enter a secure password"
    $current_date = Get-Date -DisplayHint Date
    New-LocalUser -Name "$user_name" -Password $password -FullName $user_full_name -Description "Created $current_date"
    Get-LocalUser -Name $user_name
}

Write-Output "Welcome to the new user account set up program!"

Get-NewUser


# Function enables RDP connections, enables Network Level Authentication, enables Windows firewall rules to allow incoming RDP
function Get-RdpNetAuthEnabled {
    Set-ItemProperty ‘HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\‘ -Name “fDenyTSConnections” -Value 0
    Set-ItemProperty ‘HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp\‘ -Name “UserAuthentication” -Value 1
    Enable-NetFirewallRule -DisplayGroup “Remote Desktop”
}

$enable_rdp = Read-Host "Would you like to enable RDP for this account (Y/N)?"

if ($enable_rdp = "Y") {
    Get-RdpNetAuthEnabled
}

# End