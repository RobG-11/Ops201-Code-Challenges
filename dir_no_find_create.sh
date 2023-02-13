#!/bin/bash

# Script: 06 - Conditionals
# Author: Robert Gregor
# Date of latest revision: 151422FFEB23
# Purpose:
    # Create a script that detects if a file or directory exists, then creates it if it does not exist.
    # Your script must use at least one array, one loop, and one conditional.
# Code Fellows Resources:
    # [Bash conditional statement] (https://linuxhint.com/bash_conditional_statement/)
    # [Decision Making] (https://codefellows.github.io/ops-201-guide/curriculum/class-06/challenges/demo/bash.html)
# My Sources:
    # [How do I assign ls to an array in Linux Bash?] (https://stackoverflow.com/questions/18884992/how-do-i-assign-ls-to-an-array-in-linux-bash)
    # [Check if a Bash array contains a value] (https://stackoverflow.com/questions/3685970/check-if-a-bash-array-contains-a-value)
    # [clear command in console dialog] (https://unix.stackexchange.com/questions/247695/clear-command-in-console-dialog)

# Main

clear
echo "";

while true
do
    echo ""
    echo "Enter directory would like to create";
    echo "Type 'exit' to exit"
    echo ""
    read dir_name

    if [[ $dir_name == "exit" ]]; then
        echo "";
        echo "dir_no-find_create.sh exited successfully!"
        echo "";
        exit
        fi

    ls_array=$(ls)

    if [[ "${ls_array[*]}" =~ "$dir_name" ]]; then
        echo "";
        echo "Cannot Create Directory! Already Exists!"

    else
        mkdir $dir_name
    fi
done

# End