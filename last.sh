#!/bin/bash
c=0
case $1 in
	-A)
		echo $2 $3 >>todo.txt
			;;
	-W)     echo "`cat -b todo.txt`"
			;;
	-P)     n=`cat todo.txt | wc -l`
		for i in `seq 1 $n`
		do
		x=`cat todo.txt | sort -k2 -r | head -$i | tail -1 | cut -d ' ' -f2`
		if (( x > 0 ))
		then
		echo "$i:`cat todo.txt | sort -k2 -r | head -$i | tail -1`"
		else
		if (( c == 0 ))
		then
			echo "-------Completed Tasks-------"
			c=1
		fi
		echo "$i:`cat todo.txt | sort -k2 -r | head -$i | tail -1`"
		fi
		done	
		 
			;;
	-d)
		echo "`cat todo.txt | head -$2 | tail -1`"
		echo "Are you really want to delete '`cat todo.txt | head -$2 | tail -1`' ?[Y/n]"
		read ans
		if [ $ans == 'Y' ]
		then
		sed -i "$2d;$2d" todo.txt
		echo "`bash last.sh -P`"
		fi
		if [ $ans == 'n' ]
		then
		echo "`bash last.sh -P`"
		fi
		;; 			
	-c)
 		echo "`cat todo.txt | head -$2 | tail -1`"
		echo "marking task$2 completed"
		sed -e "$2s/*/0/" todo.txt
		echo "`bash last.sh -P`"
esac
