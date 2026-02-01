#!/bin/bash

user_id=$(id -u)
logs_folder="/var/log/shellscript"
logs_file="/var/log/shellscript/$0.log"

mkdir -p "$logs_folder"


if [ $user_id -ne 0 ]; then
   echo "Please run the script with sudo user" | tee -a $logs_file
   exit 1
fi
 
echo "I am installing and starting nginx via shell scripting"

nginx -v

if [ $? -ne 0 ]; then
   sudo dnf install nginx -y &>> $logs_file
   sudo systemctl start nginx
   sudo systemctl enable nginx
else
      echo -e "nginx is already installed" | tee -a $logs_file
fi



