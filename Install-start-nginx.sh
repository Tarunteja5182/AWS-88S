#!/bin/bash

user_id=$(id -u)
logs_folder="/var/log/shellscript"
timestamp=$(date +"%Y%m%d_%H%M%S")
logs_file="$logs_folder/$(basename $0)_$timestamp.log"

mkdir -p "$logs_folder"


if [ $user_id -ne 0 ]; then
   echo "Please run the script with sudo user" | tee -a $logs_file
   exit 1
fi
 
echo "I am installing and starting nginx via shell scripting"

nginx -v

if [ $? -ne 0 ]; then
   sudo dnf install nginx -y &>> $logs_file
    if [ $? -ne 0 ]; then
     echo "Nginx installation failed" | tee -a "$logs_file"
    else
     echo "nginx installation success" | tee -a "$logs_file"
     sudo systemctl start nginx
     sudo systemctl enable nginx
   fi
else
      echo -e "nginx is already installed" | tee -a $logs_file
fi



