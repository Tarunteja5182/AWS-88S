#!/bin/bash

logs_folder="/var/log"
timestamp=$(date +"%Y%m%d_%H%M%S")
logs_file=$logs_folder/$(basename $0)_$timestamp.log
 

 if [ ! -d $logs_folder ]; then
    echo "$logs_folder doesnot exist"
    exit 1
 fi

file2del=$(find . -name "*.log" -mtime +14)
echo "$file2del are the files to be deleted"
