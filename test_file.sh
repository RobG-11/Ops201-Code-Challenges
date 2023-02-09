#!/bin/bash

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
            echo "logfile_generator.sh exited successfully!"
            echo "";
            exit
            fi

        echo "Number of records to retrieve: "
        read records_to_retrieve
        
        if [[ $records_to_retrieve == "exit" ]]; then
            echo "";
            echo "logfile_generator.sh exited successfully!"
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
