#!/bin/bash

# This will count no of words in a given text file

file2read=$1
ls -lrth|grep $file2read
if [ $? -eq 2 ];then
  echo "no such file or file or directory $file2read"
  exit 1
fi

while (read line);
do 
echo "$line"
done < $file2read