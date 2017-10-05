#!/bin/bash

echo "Please Enter the password"
read -t 7 passwd

if [ "$passwd" == alhabibi ]
then
	echo "Access Granted to habibi corp. pvt. ltd. Your account balance is Rs.1,00,000,00000"
elif [ "$passwd" == "" ]
then
	echo "Write something dumbo"
else  
         echo "This PC is like a fairytale with demons and Geras as fairies and wands respectively"
fi

