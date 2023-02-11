#!/bin/bash

# Script: 05 - Loops
# Author: Robert Gregor
# Date of latest revision: 101500FFEB23
# Purpose:
    # Write a script that displays running processes, asks the user for a PID, then kills the process with that PID
    # Use a loop in your script, will facilitate menu system of script, so it can prompt user to choose option
# Code Fellows Resources:
    # [Loops!] (https://ryanstutorials.net/bash-scripting-tutorial/bash-loops.php)
    # [bash for loop] (https://codefellows.github.io/ops-201-guide/curriculum/class-05/challenges/demo/bash.html)
    # [PowerShell Tutorial] (https://codefellows.github.io/ops-201-guide/curriculum/class-03/challenges/demo/powershell.html)
    # [Z shell Tutorial] (https://codefellows.github.io/ops-201-guide/curriculum/class-03/challenges/demo/zsh.html)
# My Sources:
    # [How to List Running Processes in Linux] (https://www.hostinger.com/tutorials/vps/how-to-manage-processes-in-linux-using-command-line)

# Main

while true
do
    ps aux
    echo ""
    echo "Enter PID to Kill Process! Type 'exit' to exit"
    echo "You can only kill processes YOUR account is running!"
    read kill_this_pid

    if [[ $kill_this_pid == "exit" ]]; then
        echo "";
        echo "logfile_generator.sh exited successfully!"
        echo "";
        exit
        fi

    kill $kill_this_pid
done

# End

