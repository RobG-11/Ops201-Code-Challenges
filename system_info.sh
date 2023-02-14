#!/bin/bash

# Script: 07 - System Information
# Author: Robert Gregor
# Date of latest revision: 141422FFEB23
# Purpose:
    # Create script that uses lshw to display system info to screen about following components:
        # Name of the computer
        # CPU (Product, Vendor, Physical ID, Bus Info, Width)
        # RAM (Description, Physical ID, Size)
        # Display Adapter (Description, Product, Vendor, Physical ID, Bus Info, Width, Clock, Capabilities, Configuration, Resources)
        # Network Adapter (Description, Product, Vendor, Physical ID, Bus Info, Logical Name, Version, Serial, Size, Capacity, Width, Clock, Capabilities, Configuration, Resources)
    # Uses grep to remove irrelevant information from lshw output
    # Add text to output clearly indicating which component (such as CPU, RAM, etc.) script is returning info about
    # Runs as Root; may execute shell script with sudo or as Root

# Code Fellows Resources:
    # [Linux lshw Command Tutorial for Beginners] (https://www.howtoforge.com/linux-lshw-command/)
    # [How to Use the Linux Grep Command] (https://careerkarma.com/blog/linux-grep-command/)
    # [Pipelines] (https://codefellows.github.io/ops-201-guide/curriculum/class-07/challenges/demo/bash.html)
# My Sources:
    # [how to grep and print the next N lines after the hit?] (https://superuser.com/questions/298123/how-to-grep-and-print-the-next-n-lines-after-the-hit)
    # [How to Grep Multiple Patterns – Syntax] (https://phoenixnap.com/kb/grep-multiple-strings)

# Main

clear
echo "";

while true
do
        echo "";
        echo "The name of this computer is '"$(hostname)"'";
        echo "";
        echo "Please choose a system component to examine:";

        echo "Type 'exit' to exit";
        echo "";
        echo "1) CPU";
        echo "2) RAM";
        echo "3) Display Adapter";
        echo "4) Network Adapter";
        echo "";
        read system_component
        echo "";

        if [[ $system_component == "exit" ]]; then
            echo "system_info.sh exited successfully!"
            exit
        elif [[ $system_component == "1" ]]; then
            sudo lshw -C cpu | head -n 7
            echo ""
        elif [[ $system_component == "2" ]]; then
            sudo lshw -C memory | tail -n 4
            echo ""
        elif [[ $system_component == "3" ]]; then
            sudo lshw -C display
            echo ""
        elif [[ $system_component == "4" ]]; then
            sudo lshw -C network
            echo ""
        else
            echo "Invalid Selection Input! Try Again!"
        fi
done

# End