#!/bin/bash
<<<<<<< HEAD
echo "Input your password :: "
password=123ABC
read -t 10 -p "IF you don't know please DON'T attempt.Press Ctrl+C.This is a secure server" guess
if [ "$guess" == "$password" ]
then echo "Correct Password"
elif [ "$guess" != "$password" ]
then echo "Incorrect Password.The owners will dial 100.You are charged under section 420 of IPC,trespassing Act"
fi
exit 0;
=======

i="task2"
read -t 10 j
if [ "$j" == "$i" ] 
then
 echo "Password correct"
elif [ "$j" == "" ]
then
 echo "No input"
else 
 echo "Password incorrect"
fi
>>>>>>> bda46393d274eb46c38323278d56846f97a58225
