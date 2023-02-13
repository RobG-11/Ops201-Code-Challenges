#!/bin/bash

# Script: 03 - Functions
# Author: Robert Gregor
# Date of latest revision: 081500FFEB23
# Purpose:
    # Write a script that prints the login history of users on this computer
    # Your script must use at least one function and one variable
# Code Fellows Resources:
    # [Bash Functions] - (https://ryanstutorials.net/bash-scripting-tutorial/bash-functions.php)
    # [Bash Tutoria] -(https://codefellows.github.io/ops-201-guide/curriculum/class-03/challenges/demo/bash.html)
    # [PowerShell Tutorial] - (https://codefellows.github.io/ops-201-guide/curriculum/class-03/challenges/demo/powershell.html)
    # [Z shell Tutorial] - (https://codefellows.github.io/ops-201-guide/curriculum/class-03/challenges/demo/zsh.html)
# My Sources:
    # [How To Find Last Login on Linux] (https://devconnected.com/how-to-find-last-login-on-linux/)
    # [How to Use the Linux head Command] (https://phoenixnap.com/kb/linux-head)
    # [Read User Input] (https://www.javatpoint.com/bash-read-user-input)
    # [How to View & Read Linux Log Files] (https://phoenixnap.com/kb/how-to-view-read-linux-log-files)
    # [Bash: If, Else If, Else Examples] (https://linuxhint.com/bash_if_else_examples/)
    # [12 Critical Linux Log Files You Must be Monitoring] (https://www.eurovps.com/blog/important-linux-log-files-you-must-be-monitoring/#mail)
    # [Bash Exit Command and Exit Codes] (https://linuxize.com/post/bash-exit/)
    # [Bash While True] (https://www.tutorialkart.com/bash-shell-scripting/bash-while-true/)
    # [How to Grep for Text in Files] (https://www.linode.com/docs/guides/how-to-grep-for-text-in-files/)

# Main

clear
echo "";

parse_log() {
    echo "";
    grep "$search_string" /tmp/log_results.txt
    # rm /tmp/log_results.txt
}

print_lastlog_records() {
    echo "";
    last --fullname | head -n $records_to_retrieve
    last --fullname | head -n $records_to_retrieve > /tmp/log_results.txt
    echo "";
    echo "Enter search string to return only records that contain that string: "
    read search_string

    parse_log
}

print_syslog_records() {
    echo "";
    cat /var/log/syslog | head -n $records_to_retrieve
    cat /var/log/syslog | head -n $records_to_retrieve > /tmp/log_results.txt
    echo "";
    echo "Enter search string to return only records that contain that string: "
    read search_string

    parse_log
}

print_auth_records() {
    echo "";
    cat /var/log/auth.log | head -n $records_to_retrieve
    cat /var/log/auth.log | head -n $records_to_retrieve > /tmp/log_results.txt
    echo "";
    echo "Enter search string to return only records that contain that string: "
    read search_string

    parse_log
}

print_bootstrap_records() {
    echo "";
    cat /var/log/bootstrap.log | head -n $records_to_retrieve
    cat /var/log/bootstrap.log | head -n $records_to_retrieve > /tmp/log_results.txt
    echo "";
    echo "Enter search string to return only records that contain that string: "
    read search_string

    parse_log
}

print_dmesg_records() {
    echo "";
    cat /var/log/dmesg | head -n $records_to_retrieve
    cat /var/log/dmesg | head -n $records_to_retrieve > /tmp/log_results.txt
    echo "";
    echo "Enter search string to return only records that contain that string: "
    read search_string

    parse_log
}

print_kern_records() {
    echo "";
    cat /var/log/kern.log | head -n $records_to_retrieve
    cat /var/log/kern.log | head -n $records_to_retrieve > /tmp/log_results.txt
    echo "";
    echo "Enter search string to return only records that contain that string: "
    read search_string

    parse_log
}

print_faillog_records() {
    echo "";
    cat /var/log/faillog | head -n $records_to_retrieve
    cat /var/log/faillog | head -n $records_to_retrieve > /tmp/log_results.txt
    echo "";
    echo "Enter search string to return only records that contain that string: "
    read search_string

    parse_log
}

while true
do

        echo "";
        echo "1) Login Records (lastlog) - last login attempts";
        echo "2) System Logging Records (syslog) - non-kernel boot errors, app-related service errors, messages logged during system startup";
        echo "3) Authentication Log Records (auth.log) - all authentication related events";
        echo "4) Bootstrap Log Records (bootstrap.log) - booting related info and messages logged during system startup process";
        echo "5) Dmesg Log Records (dmesg) - info related to hardware devices and their drivers";
        echo "6) Kernel Logging Records (kern.log) - information logged by kernel";
        echo "7) Login Failure Records (faillog) - information logged by kernel";
        echo "exit) - to exit application";
        echo "";
        echo "Log Selection: "
        read record_selection
        
        if [[ $record_selection == "exit" ]]; then
            echo "";
            echo "linux_log_parser.sh exited successfully!"
            echo "";
            exit
            fi

        echo "Number of records to retrieve: "
        read records_to_retrieve
        
        if [[ $records_to_retrieve == "exit" ]]; then
            echo "";
            echo "linux_log_parser.sh exited successfully!"
            echo "";
            exit
            fi

        if [[ $record_selection == 1 ]]; then
            print_lastlog_records

        elif [[ $record_selection == 2 ]]; then
            print_syslog_records

        elif [[ $record_selection == 3 ]]; then
            print_auth_records

        elif [[ $record_selection == 4 ]]; then
            print_bootstrap_records

        elif [[ $record_selection == 5 ]]; then
            print_dmesg_records

        elif [[ $record_selection == 6 ]]; then
            print_kern_records

        elif [[ $record_selection == 7 ]]; then
            print_faillog_records

        else
            echo "";
            echo "Invalid Log Selection Input! Try Again!";
        fi
done

#End