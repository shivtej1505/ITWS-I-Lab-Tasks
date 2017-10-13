#!/bin/bash

read -t 3 a
b="Ayush"

if [ "$a" == "$b" ]
then
    echo Password Correct!
elif [ "$a" == "" ]
then
    echo DID NoT GET AN INPUT!
else
    echo Password incorrect!
fi

