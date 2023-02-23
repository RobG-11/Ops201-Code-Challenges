#!/bin/bash

# Script: 13 - Domain Analyzer
# Author: Robert Gregor
# Date of latest revision: 221022FFEB23
# Purpose:
    # Create a script that asks a user to type a domain, then displays information about the typed domain
    # Operations that must be used include (whois, dig, host, nslookup)
# Code Fellows Resources:
    # [How to Use the whois Command on Linux] (https://www.howtogeek.com/680086/how-to-use-the-whois-command-on-linux/)
# My Sources:
    # [How to Use the whois Command on Linux] (https://www.howtogeek.com/680086/how-to-use-the-whois-command-on-linux/)
    # [How to Use the dig Command on Linux] (https://www.howtogeek.com/663056/how-to-use-the-dig-command-on-linux/)
    # [host command in Linux with examples] (https://www.geeksforgeeks.org/host-command-in-linux-with-examples/)
    # [nslookup command in Linux with Examples] (https://www.geeksforgeeks.org/nslookup-command-in-linux-with-examples/)

# Main

exe_command() {
    clear
    echo "whois results..."
    echo ""
    whois $user_domain
    echo ""
    echo "dig results..."
    echo ""
    dig $user_domain
    echo ""
    echo "host results..."
    echo ""
    host $user_domain
    echo ""
    echo "nslookup results..."
    echo ""
    nslookup $user_domain
    echo ""
    # if [[ $user_command == "1" ]]; then
    #     whois $user_domain
    #     echo ""

    # elif [[ $user_command == "2" ]]; then
    #     dig $user_domain
    #     echo ""

    # elif [[ $user_command == "3" ]]; then
    #     host $user_domain
    #     echo ""

    # elif [[ $user_command == "4" ]]; then
    #     nslookup $user_domain
    #     echo ""

    # elif [[ $user_command == "exit" ]]; then
    #     echo "";
    #     echo "domain_analyser.sh exited successfully!"
    #     echo "";
    #     exit

    # else
    #     echo "Invalid command selected!"
    #     echo ""
    # fi
}

while true
do
    echo "Please enter the domain you would like to analyze:"
    read $user_domain
    # echo ""
    # echo "1) whois - provides listing of records containing details about ownership of domains and owners"
    # echo "2} dig - query DNS servers for info regarding various DNS records (host address, mail exchanges, name servers, related info"
    # echo "3) host - used to find IP address of particular domain name "
    # echo "4) nslookup - used to query DNS to obtain domain name or IP address mapping or any other specific DNS record"
    # echo "5) exit - exits program"
    # echo ""
    # echo "Please choose the command you would like to run on your selected domain"
    # read $user_command
    
    exe_command
done

# End