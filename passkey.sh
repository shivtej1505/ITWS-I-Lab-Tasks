#!/bin/bash

Password="chumma"

read -t 5 -s passkey
 if [ "$passkey" == "$Password" ]
	then
 		echo "Welcome to the Cynthesis Systems !!!"
 elif [ "$passkey" == "" ]
	then
		 echo "Enter Your Password"
 else
 	echo "Incorrect Password"
 fi

 

