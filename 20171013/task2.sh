#!/bin/bash
read -t 5 password
if [ "$password" == "i" ]
then 
echo "match"
elif [ "$password" == "" ]
then 
echo "TIMEOUT"
else 
echo "WRONG PASSWORD"
fi
