#!/bin/bash
sum=0
read n
for (( i = 0; i < $n ; i++ )) 
do
    read m
    sum=`echo "$sum+$m" | bc`
done
avg=`echo "scale=4; $sum/$n" | bc`
printf "%.4f" $avg
echo
