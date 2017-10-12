#!/bin/bash

i="task2"
read -t 10 j
if [ "$j" == "$i" ] 
then
 echo "Password correct"
elif [ "$j" == "" ]
then
 echo "No input"
else 
 echo "Password incorrect"
fi
