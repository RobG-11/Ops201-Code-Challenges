#!/bin/bash

# Script: 09 - Log Retrieval via PowerShell
# Author: Robert Gregor
# Date of latest revision: 161022FFEB23
# Purpose:
    # Create a Powershell script that fetches useful System event logs.
        # Output all events from System event log that occurred in last 24 hours to file on desktop named last_24.txt
        # Output all “error” type events from System event log to file on desktop named errors.txt
        # Print to screen all events with ID of 16 from System event log
        # Print to screen the most recent 20 entries from System event log
        # Print to screen all sources of 500 most recent entries in System event log
            # Ensure full lines are displayed (get rid of the … and show entire text)
# Code Fellows Resources:
    # [Microsoft.PowerShell.Management] (https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.management/?view=powershell-5.1)
# My Sources:
    # [Get-EventLog] (https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.management/get-eventlog?view=powershell-5.1)
    # [How to Output to File with PowerShell Out-File Cmdlet] (https://lazyadmin.nl/powershell/output-to-file/)
    # [Get Windows event logs for last 24 hours using PowerShell] (https://vineethac.blogspot.com/2017/12/get-windows-event-logs-for-last-24.html)
    # [Write-Output] (https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/write-output?view=powershell-7.3)
    # [Chapter 9 - Functions] (https://learn.microsoft.com/en-us/powershell/scripting/learn/ps101/09-functions?view=powershell-7.3)
    # [How to keep the shell window open after running a PowerShell script?] (https://stackoverflow.com/questions/16739322/how-to-keep-the-shell-window-open-after-running-a-powershell-script)
    # [Viewing Truncated PowerShell Output] (https://greiginsydney.com/viewing-truncated-powershell-output/)

# Main

function Get-SystemLogLast24 {
    Get-EventLog -LogName System -After (Get-Date).AddDays(-1) | Format-Table -AutoSize | Out-File c:\Users\user\desktop\last_24.txt
}

function Get-SystemLogErrors {
    Get-EventLog -LogName System -EntryType Error | Format-Table -AutoSize | Out-File c:\Users\user\desktop\errors.txt
}

function Get-SystemLogID16 {
    Get-EventLog -LogName System -InstanceID 16 | Format-Table -AutoSize | Write-Output
}

function Get-SystemLogNewest20 {
    Get-EventLog -LogName System -Newest 20 | Format-Table -AutoSize | Write-Output
}

function Get-SystemLogNewest500Sources {
    Get-EventLog -LogName System -Newest 500 | Format-Table -AutoSize | Write-Output
}

Get-SystemLogLast24
Get-SystemLogErrors
Get-SystemLogID16
Get-SystemLogNewest20
Get-SystemLogNewest500Sources

powershell -noexit

# End
