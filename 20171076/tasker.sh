#!/bin/bash

function addtask { # Done
	if [[ ! -f "list.todo" ]]
	then
		touch "list.todo"
	fi	
	count=$(( `wc -l list.todo | cut -d' ' -f1` + 1 ))
	#echo "$1"
	echo "$count $1 $2" >> list.todo
}

function print5 {
	echo "`head -n 5 list.todo`"
}

function printa {
	echo "`cat list.todo`"
}

function printp {
	num=0
	i=1
	temp="`cat list.todo | sort -drk 3`"
	len="`cat list.todo | sort -drk 3 |wc -l`"
	while read -r line
	do
		
		#echo "$line"
		#echo "$line" | tr -s ' ' | cut -d' ' -f3
		#echo "$line" | tr -s ' ' | cut -d' ' -f2
		if [[ $num -eq 0 && "`echo "$line" | tr -s ' ' | cut -d' ' -f3`" -eq 0 ]]
		then
			echo "---------- Completed Tasks ------------"
			num=1
		fi
		echo "$i: `echo "$line" | tr -s ' ' | cut -d' ' -f2` `echo "$line" | tr -s ' ' | cut -d' ' -f3`"
		i=$(( i+1 ))
	done <<< "$temp"
}

if [[ "$1" == "-A" && "$#" -eq 3 ]]
then
	addtask "$2" "$3"
elif [[ "$1" == "-T" && "$#" -eq 1 ]]
then
	print5
elif [[ "$1" == "-W" && "$#" -eq 1 ]]
then
	printa "$2"
elif [[ "$1" == "-P" && "$#" -eq 1 ]]
then
	printp "$2"
else
	echo "Usage bro"
fi
