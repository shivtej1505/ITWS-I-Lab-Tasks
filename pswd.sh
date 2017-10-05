#!/bin/bash
read -t 5 i 
if [ "$i" == "iiit" ]
then
echo "matches"
elif [ "$i" == "" ]
then
echo "TIMEOUT" 
else
echo "incorrect password"  
fi
