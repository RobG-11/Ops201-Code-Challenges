#!/bin/bash

# Main


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
