# Script: 10 - System Process Commands
# Author: Robert Gregor
# Date of latest revision: 171022FFEB23
# Purpose:
    # Create a Powershell script that performs these operations on separate lines.
    # The overall script is not designed to operate holistically, but rather act as a reference for how to execute various interesting operations with the process family of Powershell commandlets.
    # Clearly indicate with comments each component below.
        # 1. Print to terminal all active processes ordered by highest CPU time consumption at top
        # 2. Print to terminal all active processes ordered by highest Process Identification Number at top
        # 3. Print to terminal top five active processes ordered by highest Working Set (WS(K)) at top
        # 4. Start process Internet Explorer (iexplore.exe) and have it open https://owasp.org/www-project-top-ten/
        # 5. Start process Internet Explorer (iexplore.exe) ten times using for loop
            # Have each instance open https://owasp.org/www-project-top-ten/
        # 6. Close all Internet Explorer windows
        # 7. Kill process by its Process Identification Number
            # Choose process whose termination won’t destabilize system, such as Internet Explorer or MS Edge

# My Sources:
    # [Get-Process] (https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.management/get-process?view=powershell-7.3)
    # [Sort-Object] (https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/sort-object?view=powershell-7.3)
    # [Open URL in browser in PowerShell] (https://debug.to/696/open-url-in-browser-in-powershell)
    # [about_For] (https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_for?view=powershell-7.3)
    # [Stop-Process] (https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.management/stop-process?view=powershell-7.3)

# Main

function Get-AllActProcByCPU {
    Get-Process | Sort-Object -Property CPU -Descending
}

function Get-AllActProcByID {
    Get-Process | Sort-Object -Property Id -Descending
}

function Get-TopFiveProcByWS {
    Get-Process | Sort-Object -Property WS -Descending | Select-Object -Last 5
}

function Get-StartIEOwasp {
    Start-Process msedge.exe "https://owasp.org/www-project-top-ten/"
}

function Get-StartIEOwaspXten {
    $i = 1
    for (;$i -le 10;$i++) 
    {
        Start-Process msedge.exe "https://owasp.org/www-project-top-ten/"
    }
}

function Get-KillProcIEbyID {
    Stop-Process -Name msedge.exe
}

Get-AllActProcByCPU
Write-Host "All active processes ordered by highest CPU time consumption listed above, press any key to continue..."
$Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

Get-AllActProcByID
Write-Host "All active processes ordered by highest Process Identification Number listed above, press any key to continue..."
$Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

Get-TopFiveProcByWS
Write-Host "Top five active processes ordered by highest Working Set listed above, press any key to continue..."
$Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

Get-StartIEOwasp
Write-Host "Owasp top 10 opened in default browser, press any key to continue..."
$Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

Get-StartIEOwaspXten
Write-Host "Owasp top 10 opened ten times in default browser, press any key to continue..."
$Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

Get-KillProcIEbyID
Write-Host "All IE browser windows closed, iexplore.exe process killed, press any key to continue..."
$Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

powershell -noexit

# End