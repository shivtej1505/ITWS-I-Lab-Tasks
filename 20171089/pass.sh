#!/bin/bash
read pas
if [ "$pas" == "iammaster" ]
then
	echo "Correct Password"
elif [ -z "$pas" ] 
then
	echo "Enter something DUMBO!!"
else
	echo "BUG OFF LOSER!!!"
fi
