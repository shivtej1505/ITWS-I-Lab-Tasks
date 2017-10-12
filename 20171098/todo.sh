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

function d {
	while :
	do
		read -p "Are you sure you want to delete task $1? [Y/N]" choice
		if [[ $choice = 'Y' ]]
		then
			touch temp
			tasks=`cat tasks.txt | tr ' ' ':'`
			n=1
			for i in $tasks
			do
				if [ $n -ne $1 ]
				then
					echo "`echo $i | tr ':' ' '`" >> temp
				fi
				n=$(( n + 1 ))	
			done
			rm tasks.txt
			mv temp tasks.txt
			echo "Deleted task $1."
			break
		elif [[ $choice = 'N' ]]
		then 
			echo "Did not delete task."
			break
		fi
	done
}

function c {
	touch temp
	tasks=`cat tasks.txt | tr ' ' ':'`
	n=1
	for i in $tasks
	do
		if [ $n -eq $1 ]
		then
			task_name=`cut -d':' -f1`
			s=$task_name':0'
			echo "`echo $s | tr ':' ' '`" >> temp
		fi
		n=$(( n + 1 ))	
	done
	rm tasks.txt
	mv temp tasks.txt
	echo "Marked task $1 as complete."
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
		fi
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
elif [[ $1 = '-d' ]]
then
	task_no=$2
	n_tasks=`wc -l tasks.txt | cut -d' ' -f1`
	if [[ $task_no =~ ^[0-9]+$ && $task_no -le $n_tasks ]]
	then
		d $task_no
	else
		echo "Task number $2 does not exist."
	fi
elif [[ $1 = '-c' ]]
then
	task_no=$2
	n_tasks=`wc -l tasks.txt | cut -d' ' -f1`
	if [[ $task_no =~ ^[0-9]+$ && $task_no -le $n_tasks ]]
	then
		c $task_no
	else
		echo "Task number $2 does not exist."
	fi
else
	echo "Usage: bash todo.sh -A [task-name]"
	echo "       bash todo.sh -[T|P|W]"
fi
