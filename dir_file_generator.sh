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

dir_create(){
    if [[ $dirs_to_create == 1 ]]; then
    mkdir dir1
    dir_array=("./dir1/")
    files_to_create_d1

    elif [[ $dirs_to_create == 2 ]]; then
    mkdir dir1 dir2
    dir_array=("./dir1/" "./dir2/")
    files_to_create_d1
    files_to_create_d2

    elif [[ $dirs_to_create == 3 ]]; then
    mkdir dir1 dir2 dir 3
    dir_array=("./dir1/" "./dir2/" "./dir3/")
    files_to_create_d1
    files_to_create_d2
    files_to_create_d3

    elif [[ $dirs_to_create == 4 ]]; then
    mkdir dir1 dir2 dir3 dir4
    dir_array=("./dir1/" "./dir2/" "./dir3/" "./dir4/")
    files_to_create_d1
    files_to_create_d2
    files_to_create_d3
    files_to_create_d4

    elif [[ $dirs_to_create == 5 ]]; then
    mkdir dir1 dir2 dir3 dir4 dir5
    dir_array=("./dir1/" "./dir2/" "./dir3/" "./dir4/" "./dir5/")
    files_to_create_d1
    files_to_create_d2
    files_to_create_d3
    files_to_create_d4
    files_to_create_d5

    else
        echo "";
        echo "Invalid Input! Try Again!";
    fi
}

files_to_create_d1 (){
    if [[ $files_to_create == 1 ]]; then
    touch "${dir_array[0]}file1.txt"

    elif [[ $files_to_create == 2 ]]; then
    touch "${dir_array[0]}file1.txt"
    touch "${dir_array[0]}file2.txt"

    elif [[ $files_to_create == 3 ]]; then
    touch "${dir_array[0]}file1.txt"
    touch "${dir_array[0]}file2.txt"
    touch "${dir_array[0]}file3.txt"

    elif [[ $files_to_create == 4 ]]; then
    touch "${dir_array[0]}file1.txt"
    touch "${dir_array[0]}file2.txt"
    touch "${dir_array[0]}file3.txt"
    touch "${dir_array[0]}file4.txt"

    elif [[ $files_to_create == 5 ]]; then
    touch "${dir_array[0]}file1.txt"
    touch "${dir_array[0]}file2.txt"
    touch "${dir_array[0]}file3.txt"
    touch "${dir_array[0]}file4.txt"
    touch "${dir_array[0]}file5.txt"

    else
        echo "";
        echo "Invalid Input! Try Again!";
    fi
}

files_to_create_d2 (){
    if [[ $files_to_create == 1 ]]; then
    touch "${dir_array[1]}file1.txt"

    elif [[ $files_to_create == 2 ]]; then
    touch "${dir_array[1]}file1.txt"
    touch "${dir_array[1]}file2.txt"

    elif [[ $files_to_create == 3 ]]; then
    touch "${dir_array[1]}file1.txt"
    touch "${dir_array[1]}file2.txt"
    touch "${dir_array[1]}file3.txt"

    elif [[ $files_to_create == 4 ]]; then
    touch "${dir_array[1]}file1.txt"
    touch "${dir_array[1]}file2.txt"
    touch "${dir_array[1]}file3.txt"
    touch "${dir_array[1]}file4.txt"

    elif [[ $files_to_create == 5 ]]; then
    touch "${dir_array[1]}file1.txt"
    touch "${dir_array[1]}file2.txt"
    touch "${dir_array[1]}file3.txt"
    touch "${dir_array[1]}file4.txt"
    touch "${dir_array[1]}file5.txt"

    else
        echo "";
        echo "Invalid Input! Try Again!";
    fi
}

files_to_create_d3 (){
    if [[ $files_to_create == 1 ]]; then
    touch "${dir_array[2]}file1.txt"

    elif [[ $files_to_create == 2 ]]; then
    touch "${dir_array[2]}file1.txt"
    touch "${dir_array[2]}file2.txt"

    elif [[ $files_to_create == 3 ]]; then
    touch "${dir_array[2]}file1.txt"
    touch "${dir_array[2]}file2.txt"
    touch "${dir_array[2]}file3.txt"

    elif [[ $files_to_create == 4 ]]; then
    touch "${dir_array[2]}file1.txt"
    touch "${dir_array[2]}file2.txt"
    touch "${dir_array[2]}file3.txt"
    touch "${dir_array[2]}file4.txt"

    elif [[ $files_to_create == 5 ]]; then
    touch "${dir_array[2]}file1.txt"
    touch "${dir_array[2]}file2.txt"
    touch "${dir_array[2]}file3.txt"
    touch "${dir_array[2]}file4.txt"
    touch "${dir_array[2]}file5.txt"

    else
        echo "";
        echo "Invalid Input! Try Again!";
    fi
}

files_to_create_d4 (){
    if [[ $files_to_create == 1 ]]; then
    touch "${dir_array[3]}file1.txt"

    elif [[ $files_to_create == 2 ]]; then
    touch "${dir_array[3]}file1.txt"
    touch "${dir_array[3]}file2.txt"

    elif [[ $files_to_create == 3 ]]; then
    touch "${dir_array[3]}file1.txt"
    touch "${dir_array[3]}file2.txt"
    touch "${dir_array[3]}file3.txt"

    elif [[ $files_to_create == 4 ]]; then
    touch "${dir_array[3]}file1.txt"
    touch "${dir_array[3]}file2.txt"
    touch "${dir_array[3]}file3.txt"
    touch "${dir_array[3]}file4.txt"

    elif [[ $files_to_create == 5 ]]; then
    touch "${dir_array[3]}file1.txt"
    touch "${dir_array[3]}file2.txt"
    touch "${dir_array[3]}file3.txt"
    touch "${dir_array[3]}file4.txt"
    touch "${dir_array[3]}file5.txt"

    else
        echo "";
        echo "Invalid Input! Try Again!";
    fi
}

files_to_create_d5 (){
    if [[ $files_to_create == 1 ]]; then
    touch "${dir_array[4]}file1.txt"

    elif [[ $files_to_create == 2 ]]; then
    touch "${dir_array[4]}file1.txt"
    touch "${dir_array[4]}file2.txt"

    elif [[ $files_to_create == 3 ]]; then
    touch "${dir_array[4]}file1.txt"
    touch "${dir_array[4]}file2.txt"
    touch "${dir_array[4]}file3.txt"

    elif [[ $files_to_create == 4 ]]; then
    touch "${dir_array[4]}file1.txt"
    touch "${dir_array[4]}file2.txt"
    touch "${dir_array[4]}file3.txt"
    touch "${dir_array[4]}file4.txt"

    elif [[ $files_to_create == 5 ]]; then
    touch "${dir_array[4]}file1.txt"
    touch "${dir_array[4]}file2.txt"
    touch "${dir_array[4]}file3.txt"
    touch "${dir_array[4]}file4.txt"
    touch "${dir_array[4]}file5.txt"

    else
        echo "";
        echo "Invalid Input! Try Again!";
    fi
}

echo "";
echo "Number of directories to create (1-10) ?"
read dirs_to_create

echo "";
echo "Number of files to create in each directory (1-10) ?"
read files_to_create
echo "";

dir_create

# End