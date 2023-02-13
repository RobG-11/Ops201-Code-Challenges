#!/bin/bash

# Script: 05 - Loops
# Author: Robert Gregor
# Date of latest revision: 111022FFEB23
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
    # [How to Grep on a Variable or Grep a String From a Variable] (https://www.putorius.net/grep-string-from-a-variable.html)
    # [How To Use grep Command In Linux] (https://www.cyberciti.biz/faq/howto-use-grep-command-in-linux-unix/)
    # [Bash Assign Output of Shell Command To Variable] (https://www.cyberciti.biz/faq/unix-linux-bsd-appleosx-bash-assign-variable-command-output/)
    # [grep to search data in first column] (https://stackoverflow.com/questions/32555757/grep-to-search-data-in-first-column)

# Main

clear
echo "";

while true
do
    current_user= whoami
    if [[ $current_user == "root" ]]; then
        ps -aux

    else
        ps -aux | grep --color ^$(whoami)
    fi

    echo ""
    echo "Process list above includes only the processes you are authorized to kill"
    echo "Enter PID to Kill Process YOU are running! Type 'exit' to exit program"
    
    read kill_this_pid

    if [[ $kill_this_pid == "exit" ]]; then
        echo "";
        echo "process_killer.sh exited successfully!"
        echo "";
        exit
        fi

    kill $kill_this_pid

done

# End

