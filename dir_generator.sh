#!/bin/bash

# Script: 04 - Arrays
# Author: Robert Gregor
# Date of latest revision: 091836FFEB23
# Purpose:
    # Review the process for creating a new directory.
    # Create four directories using the script.
    # Load each directory path into an array.
    # Create new .txt file within each directory by referencing directory with array indices
        # Not the literal directory path.
    # Test & validate.
# Code Fellows Resources:
    # [Using Arrays in Bash] - (https://linuxhandbook.com/bash-arrays/)
    # [Bash Concatenate Strings] -(https://linuxize.com/post/bash-concatenate-strings/)
    # [Arrays] - (https://codefellows.github.io/ops-201-guide/curriculum/class-04/challenges/demo/bash.html)
# My Sources:
    # 
# Main

mkdir dir1 dir2 dir3 dir4

path_array=("./dir1/" "./dir2/" "./dir3/" "./dir4/")

touch "${path_array[0]}file1.txt"
touch "${path_array[1]}file1.txt"
touch "${path_array[2]}file1.txt"
touch "${path_array[3]}file1.txt"

# End