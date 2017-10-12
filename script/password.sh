#!/bin/bash
read -t 5 a
if [ "$a" != "\0" ] 
then 
echo timeout
else
if [ "$a" = "sultan" ]
then 
echo matched
else
echo sorry
fi
fi
