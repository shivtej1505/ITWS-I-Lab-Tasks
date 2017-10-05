#!/bin/bash
echo "Input your password :: "
password=123ABC
read -t 10 -p "IF you don't know please DON'T attempt.Press Ctrl+C.This is a secure server" guess
if [ "$guess" == "$password" ]
then echo "Correct Password"
elif [ "$guess" != "$password" ]
then echo "Incorrect Password.The owners will dial 100.You are charged under section 420 of IPC,trespassing Act"
fi
exit 0;
