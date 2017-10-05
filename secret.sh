#!/bin/bash
echo "Enter password:"
read -s word
password=kitkat
if [ "$word" == "$password" ]
then 
echo Kitkat is better than Milky Way
else
echo Nope
fi
