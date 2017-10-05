#!/bin/bash

Password="1234"

read -t 2 PASSWORD

if [ "$PASSWORD" == "1234" ]
	then
		echo "WELCOME"
elif [ "$PASSWORD" == "" ]
	then
		echo "kuch bolo to dete"
else
	echo "matlab kuch bhi?"
fi

