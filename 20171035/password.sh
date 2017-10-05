#!/bin/bash
password="pulkit"
read -s -t 10 pass
if [ $? == 0 ]
then
	if [ $pass == $password ]
	then 
		echo "Hello world"
	else
		echo "Crash ho gaya"
	fi
else
	echo "jaldi bata"
fi

