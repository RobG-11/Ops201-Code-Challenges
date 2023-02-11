#!/bin/bash

# Main

while true
do
    ps aux
    echo ""
    echo "Enter PID to Kill Process YOU are running! Type 'exit' to exit program"
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
