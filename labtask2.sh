#!/bin/bash
echo "Enter the security key:"
read -s key
pword=abcd
if [ "$key" == "$pword" ]
then
echo "verfied"
else 
echo "access denied"
fi


