#!/bin/bash
if [ $1 == "-A" ]
then
	bash runtest.sh $2 $3 

elif [ $1 == "-T" ]
then 
	cat -b test1 |head -n 5

elif [ $1 == "-W" ]
then
	cat -b test1

elif [ $1 == "-P" ]
then
	count=`cat test1|wc -l`
	for((i=1;i<=count;i++)); do num=`cat test1|sort -k2 -nr|cut -f2|head -$i|tail -1`; text=`cat test1|sort -k2 -nr|cut -f1|head -$i|tail -1`; if (( $num >0)) ; then echo "$i $text $num"; else zero=$i
	break;
	fi
	done
	echo "------Completed tasks------"
	for((i=zero;i<=count;i++))
	do
		num=`cat test1|sort -k2 -nr|cut -f2|head -$i|tail -1`
		text=`cat test1|sort -k2 -nr|cut -f1|head -$i|tail -1`
		echo "$i $text $num"
	done

elif [ $1 == "-d" ]
then
	text=`cat test1|head -n $2|tail -1`
	echo "Are you really want to delete '$text' ? [Y/n]"
	read ans
	if [ $ans == "Y"]
	then
		sed -i "/$text/d" test1
	else
		echo "Action aborted"
		break
	fi

elif [ $1 == "-c" ]
then
	num=`cat test1|head -n $2|tail -1|cut -f2`
	sed -ie "$2s/$num/0/" test1
	cat test1|head -n $2|tail -1
	echo "marking task $2 completed"

elif [ $1 == "-D" ]
then
	
	echo "Are you really want to delete all to-dos ? [Y/n]"
	read option
	if [ $option == "Y" ]
	then
		rm test1
		touch test1
	else
		echo "Action aborted"
	fi
else
	echo "wrong command usage"
	echo "See command usage here :http ://tinyurl.com/lab-7-task"
fi
