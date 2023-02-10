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


# var=3
# echo $var
# arr=(4 1 "hello" $var)
# echo ${arr[2]} # prints slot 2 in array

# arr[2]=7  # changed value in array slot 2 to 7
# echo ${arr[2]}

dir_create(){
    if [[ $dirs_to_create == 1 ]]; then
    mkdir dir1
    dir_array=("./dir1/")
    files_to_create

    elif [[ $dirs_to_create == 2 ]]; then
    mkdir dir1 dir2
    dir_array=("./dir1/" "./dir2/")
    files_to_create

    elif [[ $dirs_to_create == 3 ]]; then
    mkdir dir1 dir2 dir 3
    dir_array=("./dir1/" "./dir2/" "./dir3/")
    files_to_create

    elif [[ $dirs_to_create == 4 ]]; then
    mkdir dir1 dir2 dir3 dir4
    dir_array=("./dir1/" "./dir2/" "./dir3/" "./dir4/")
    files_to_create

    elif [[ $dirs_to_create == 5 ]]; then
    mkdir dir1 dir2 dir3 dir4 dir5
    dir_array=("./dir1/" "./dir2/" "./dir3/" "./dir4/" "./dir5/")
    files_to_create

    elif [[ $dirs_to_create == 6 ]]; then
    mkdir dir1 dir2 dir3 dir4 dir5 dir6
    dir_array=("./dir1/" "./dir2/" "./dir3/" "./dir4/" "./dir5/" "./dir6/")
    files_to_create

    elif [[ $dirs_to_create == 7 ]]; then
    mkdir dir1 dir2 dir3 dir4 dir5 dir6 dir7
    dir_array=("./dir1/" "./dir2/" "./dir3/" "./dir4/" "./dir5/" "./dir6/" "./dir7/")
    files_to_create

    elif [[ $dirs_to_create == 8 ]]; then
    mkdir dir1 dir2 dir3 dir4 dir5 dir6 dir7 dir8
    dir_array=("./dir1/" "./dir2/" "./dir3/" "./dir4/" "./dir5/" "./dir6/" "./dir7/" "./dir8/")
    files_to_create

    elif [[ $dirs_to_create == 9 ]]; then
    mkdir dir1 dir2 dir3 dir4 dir5 dir6 dir7 dir8 dir9
    dir_array=("./dir1/" "./dir2/" "./dir3/" "./dir4/" "./dir5/" "./dir6/" "./dir7/" "./dir8/" "./dir9/")
    files_to_create

    elif [[ $dirs_to_create == 10 ]]; then
    mkdir dir1 dir1 dir2 dir3 dir4 dir5 dir6 dir7 dir8 dir9 dir10
    dir_array=("./dir1/" "./dir2/" "./dir3/" "./dir4/" "./dir5/" "./dir6/" "./dir7/" "./dir8/" "./dir9/" "./dir10/")
    files_to_create

    else
        echo "";
        echo "Invalid Input! Try Again!";
    fi
}

files_to_create(){
    if [[ $files_to_create == 1 ]]; then
    touch "${dir_array[0]}file1.txt"

    elif [[ $files_to_create == 2 ]]; then
    touch "${dir_array[0]}file1.txt"
    touch "${dir_array[1]}file2.txt"

    elif [[ $files_to_create == 3 ]]; then
    touch "${dir_array[0]}file1.txt"
    touch "${dir_array[1]}file2.txt"
    touch "${dir_array[2]}file3.txt"

    elif [[ $files_to_create == 4 ]]; then
    touch "${dir_array[0]}file1.txt"
    touch "${dir_array[1]}file2.txt"
    touch "${dir_array[2]}file3.txt"
    touch "${dir_array[3]}file4.txt"

    elif [[ $files_to_create == 5 ]]; then
    touch "${dir_array[0]}file1.txt"
    touch "${dir_array[1]}file2.txt"
    touch "${dir_array[2]}file3.txt"
    touch "${dir_array[3]}file4.txt"
    touch "${dir_array[4]}file5.txt"
    
    elif [[ $files_to_create == 6 ]]; then
    touch "${dir_array[0]}file1.txt"
    touch "${dir_array[1]}file2.txt"
    touch "${dir_array[2]}file3.txt"
    touch "${dir_array[3]}file4.txt"
    touch "${dir_array[4]}file5.txt"
    touch "${dir_array[5]}file6.txt"

    elif [[ $files_to_create == 7 ]]; then
    touch "${dir_array[0]}file1.txt"
    touch "${dir_array[1]}file2.txt"
    touch "${dir_array[2]}file3.txt"
    touch "${dir_array[3]}file4.txt"
    touch "${dir_array[4]}file5.txt"
    touch "${dir_array[5]}file6.txt"
    touch "${dir_array[6]}file7.txt"

    elif [[ $files_to_create == 8 ]]; then
    touch "${dir_array[0]}file1.txt"
    touch "${dir_array[1]}file2.txt"
    touch "${dir_array[2]}file3.txt"
    touch "${dir_array[3]}file4.txt"
    touch "${dir_array[4]}file5.txt"
    touch "${dir_array[5]}file6.txt"
    touch "${dir_array[6]}file7.txt"
    touch "${dir_array[7]}file8.txt"

    elif [[ $files_to_create == 9 ]]; then
    touch "${dir_array[0]}file1.txt"
    touch "${dir_array[1]}file2.txt"
    touch "${dir_array[2]}file3.txt"
    touch "${dir_array[3]}file4.txt"
    touch "${dir_array[4]}file5.txt"
    touch "${dir_array[5]}file6.txt"
    touch "${dir_array[6]}file7.txt"
    touch "${dir_array[7]}file8.txt"
    touch "${dir_array[8]}file9.txt"

    elif [[ $files_to_create == 10 ]]; then
    touch "${dir_array[0]}file1.txt"
    touch "${dir_array[1]}file2.txt"
    touch "${dir_array[2]}file3.txt"
    touch "${dir_array[3]}file4.txt"
    touch "${dir_array[4]}file5.txt"
    touch "${dir_array[5]}file6.txt"
    touch "${dir_array[6]}file7.txt"
    touch "${dir_array[7]}file8.txt"
    touch "${dir_array[8]}file9.txt"
    touch "${dir_array[9]}file10.txt"

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

# mkdir dir1 dir2 dir3 dir4 dir5 dir6 dir7 dir8 dir9 dir10
# dir_array=("./dir1/" "./dir2/" "./dir3/" "./dir4/" "./dir5/" "./dir6/" "./dir7/" "./dir8/" "./dir9/" "./dir10/")


# touch "${path_array[0]}file1.txt"
# touch "${path_array[1]}file1.txt"
# touch "${path_array[2]}file1.txt"
# touch "${path_array[3]}file1.txt"

# End
