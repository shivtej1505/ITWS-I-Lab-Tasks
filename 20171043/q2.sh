#!/bin/bash

function TOP()
{
	n=1
	cat priority.txt | while read i
	do
		echo "$n $i"
		if [ $n -eq 5 ]
		then
			break
		fi
		n=$((n+1))
	done
}

function ADD()
{
	echo "$1 $2">> priority.txt
}

function PRINT()
{
	n=1
	cat priority.txt | while read i
	do
		echo "$n $i"
		n=$((n+1))
	done
}

function PPRINT()
{
	counter=0
	serial=1
	cat priority.txt | sort -n -k2 -r >temp.txt
	cat temp.txt | while read i
	do
		n=`echo $i |rev | cut -d ' ' -f1`
		if [ "$counter" == "0" ] && [ "$n" == "0" ]
		then
			counter=$((counter+1))
			echo ------- Completed Tasks -------
		fi
		echo "$serial : $i"
		serial=$((serial+1))
	done
	rm temp.txt
}

function DELETE()
{	
	echo "ARE YOU SURE YOU WANT TO DELETE \'$2 $3\' ?[Y/n]" 
	read ans
	N=$1
	if [ "$ans" == "Y" ]
	then
		sed -i "${N}d" priority.txt
		echo DELETING TASK $1	
	else
		echo TASK $1 NOT DELETED
	fi
}

function COMPLETE()
{
	ctr=1
	touch t.txt
	cat priority.txt | while read i
	do
		if [ $ctr -eq $1 ]
		then	
			T=`echo "$i" | cut -d ' ' -f1`
			echo MARKING TASK $1 COMPLETED.
			echo "$T  0">>t.txt
		else
			echo "$i">>t.txt
		fi
		ctr=$((ctr+1))
	done
	rm priority.txt
	mv t.txt priority.txt
}

function MEGADELETE()
{
	echo "DO YOU REALLY WANT TO DELETE THE ENTIRE TO-DO's LIST ? [Y/n]"
	read response
	if [ "$response" == "Y" ]
	then
		rm priority.txt
		echo "TO -DO's LIST DELETED"
	else
		echo "ACTION ABORTED"
	fi
	touch priority.txt
}

case "$1" in
	-A ) ADD "$2" "$3"
		;; 
	-T ) TOP
		;;
	-W ) PRINT
		;;
	-P ) PPRINT
		;;
 	-d ) DELETE "$2" "$3" "$4"
		;;
	-c ) COMPLETE "$2"
		;;
	-D ) MEGADELETE
		;;
	 * ) echo INCORRECT USAGE OF THE COMMAND
		echo USE : 
		echo
		echo -A \<task_name\> \<task_priority\>	
		echo add a task
		echo
		echo -T 
		echo display top 5 tasks
		echo
		echo -W
		echo display all tasks
		echo
		echo -P
		echo list all tasks sorted by priority
		echo
		echo -d \<task_serial\> \<task_name\> \<task_priority\>
		echo delete the task
		echo
		echo -c \<task_serial\>
		echo mark a task complete	
		echo
		echo -D
		echo delete the entire list
		;;
esac
