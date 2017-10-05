#!/bin/bash

read -t 15 -p "Enter a password " password
correct="sparta123"
if [ "$password" == "" ]
then
	echo "Empty Password";

elif [ "$password" == "$correct" ]
then
	echo "Correct Password";
else 
	echo "Wrong Password";

fi
