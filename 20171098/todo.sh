#!/bin/bash/

function A {
	echo "$1 $2" >> tasks.txt
}

function P {
	tasks=`cat tasks.txt | tr ' ' ':' | sort -t':' -k2nr`
	reached_completed=0
	n=1
	for i in $tasks
	do
		if [[ `echo $i | cut -d':' -f2` = '0' && $reached_completed = '0' ]]
		then
			echo "------- Completed Tasks--------"
			reached_completed=1
		fi
		printf "%d %s\n" "$n" "`echo $i | tr ':_' '  '`"
		n=$(( n + 1 ))
	done
}

function T {
	tasks=`head -5 tasks.txt | tr ' ' ':'`
	n=1
	for i in $tasks
	do
		printf "%d %s\n" "$n" "`echo $i | tr ':' ' ' | tr '_' ' '`"
		n=$(( n + 1 ))
	done
}

function W {
	tasks=`cat tasks.txt | tr ' ' ':'`
	n=1
	for i in $tasks
	do
		printf "%d %s\n" "$n" "`echo $i | tr ':_' '  '`"
		n=$(( n + 1 ))
	done
}

if [[ ! -e tasks.txt ]]
then
	touch tasks.txt
fi

if [[ $1 = '-A' ]]
then
	if [ $# -eq '3' ]
	then
		if [[ 0 -le $3 && $3 -le 3 ]]
		then
			A `echo $2 | tr ' ' '_'` $3
		else
			echo "Priority of task must be 0 (complete), 1, 2, or 3."
	else
		echo "Usage: bash todo.sh \"task name\" priority"
	fi
elif [[ $1 = '-T' ]]
then
	T
elif [[ $1 = '-W' ]]
then
	W
elif [[ $1 = '-P' ]]
then
	P
else
	echo "Usage: bash todo.sh -A [task-name]"
	echo "       bash todo.sh -[T|P|W]"
fi
