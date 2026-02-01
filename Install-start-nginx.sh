#!/bin/bash

echo -e "I am installing and starting nginx via shell scripting"

nginx -v

if [$? ne 0] then
   sudo dnf install nginx -y 
   sudo systemctl start nginx
   sudo systemctl enable nginx
else
   echo -e "nginx is already installed 
fi



