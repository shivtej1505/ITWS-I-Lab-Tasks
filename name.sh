#!/bin/bash
name=$1
college=$2


if [ $# -lt 2 ]
    then
        echo Not enough arguements
else
    echo "My name is $name"
    echo "I'm studying in $college"
fi
