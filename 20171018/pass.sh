#!bin/bash

read -st 10 char 

clear
if [ $? -ne 0 ]
then
	echo "enter something bruh..."
elif [ $char == "triskilion" ]
then
	echo "Arc reactor calliberation complete. God Armour powering up..."
else
	echo "Damn you cap"
fi
