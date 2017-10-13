#!/bin/bash

if [ "$1" == "-A" ]
then
	echo  "$2 $3" >> todo.txt
		count=$count+1
		if [ $3 -ne 0 ]
		then
			count1=$count1+1
		fi
elif [ "$1" == "-T" ]
then
	for(( i=1;i<=5;i++ ))
	do
		t=`cat todo.txt | head -$i | tail -1`
		echo $i $t
	done
elif [ "$1" == "-W" ]
then
	x=`cat todo.txt | wc -l`
	for(( i=1;i<=$x;i++ ))
	do
		t=`cat todo.txt |head -$i | tail -1`
		echo $i $t
	done
elif [ "$1" == "-P" ]
then
	x=`cat todo.txt | wc -l`
	y=`cat todo.txt | cut -d " " -f 2 | grep '0' | wc -w`
	b=`cat todo.txt | cut -d " " -f 2`
	for(( i=1;i<=$x;i++ ))
	do
		if [ "$b" != "0" ]
		then
			a=`cat todo.txt | sort -nr -k 2 | head -$i | tail -1`
			echo $i: $a
		fi
		if [ $i -eq $(($x-$y)) ]
		then
			echo "-----completed task---------"
		fi
	
		if [ "$b" == "0" ]
		then
			cat -n todo.txt
		fi	
	done	 

elif [ "$1" == "-d" ]
then
	del=`cat todo.txt | head -$2 | tail -1`
	echo $del
	echo "Are you really want to delete '$del' ?[Y/n]"
	read ans
	if [ "$ans" == "Y" ]
	then
		sed -i "/$del/d" todo.txt
		echo "deleting task $2"
	fi
elif [ "$1" == "-c" ]
then
	task=`cat todo.txt| head -$2|tail -1`
	comp=`cat todo.txt | head -$2 | tail -1| cut -d " " -f 2`
	echo "$task"
	echo "marking task 3 completed"
	sed -i "s/$comp/0/g" todo.txt

elif [ "$1" == "-D" ]
then
	sed '' todo.txt > todo.txt

else
	echo -e "wrong command usage\nSee command usage here: http://tinyurl.com/lab/lab-7-task"
fi
