#!/bin/bash
read -t 5 a
if [ "$a" = "" ]
then
	echo timeout
else
if [ "$a" = "aezakmi" ]
then
 echo matched
else
echo "not matched"
fi
fi
