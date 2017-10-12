#!/bin/bash
flag=0
if [ $1 == -'A' ]
then 
	echo $2 $3 >> todo.txt
elif [ $1 == -'T' ]
then 
	cat -b todo.txt | head -5	
elif [ $1 == -'W' ]
then
	cat -b todo.txt 
elif [ $1 == -'P' ]
then 
	cat -b todo.txt | sort -nr -k3 
elif [ $1 == -'d' ]
then 
	echo "Are you sure you want to delete task "$2"? "
	read response 
		if [ "$response" == "Y" ]
		then
			hel=`cat -b todo.txt | grep "Task"$2"" | awk '{ print $1 }'`
			sed -i "$hel"d todo.txt
		fi	
	cat -b todo.txt
elif [ $1 == -'c' ]
then
	hel=`cat -b todo.txt | grep "Task"$2"" | awk '{ print $1 }'`
	sed -i "$hel"d todo.txt
	echo "Task"$2" 0" >> todo.txt
elif [ $1 == -'D' ]
then
	rm todo.txt
	touch todo.txt
	echo List deleted
else
	echo Wrong command usage
	echo see usage in tinyurl.com/lab-7-task
fi


