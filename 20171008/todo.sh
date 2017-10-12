#!/bin/bash

total=$#
flag=1
file="list.txt"

if [ ! -f $file ]
then
	touch $file
fi

if [ $1 == '-A' && $total -eq 3 ]
then
	flag=0
	echo "$2 $3" >> $file
elif [ $1 == '-T' && $total -eq 1 ]
then
	flag=0
	i=0
	while read line in $file
	do
		i=$(($i+1))
		echo "$i  $line"
		if [[ $i -eq 5 ]]
		then
			break
		fi
	done
elif [ $1 == '-W' && $total -eq 1 ]
then
	flag=0
	i=0
        while read line in $file
        do
                i=$(($i+1))
                echo "$i  $line"
        done
elif [ $1 == '-P' && $total -eq 1 ]
then
	flag=0
	n=`cat $file | wc -l`
	a=( "$n" )
	t=( "$n" )
	i=0
	while read line in $file
	do
		a[$(($i))]=`echo $line | tr -s " " | cut -d " " -f3`
		l[$(($i))]=`echo $line | tr -s " " | cut -d " " -f2`
		i=$(($i+1))
	done

	# `cat $file | sort -rk2` will sort by the priority field
	for(( x=0; x<n-1; x++ ))
	do
		min=$x
		for(( y=$x+1; y<n; y++ ))
		do
			if [ ${a[$y]} -lt ${a[$min]} ]
			then
				min=$y
			fi
		done
		
		ta=${a[$x]}
		a[$x]=${a[$min]}
		a[$min]=$ta

		tl=${l[$x]}
                l[$x]=${l[$min]}
                l[$min]=$tl
	done

	check=0
	for(( k=0; k<n; k++ ))
	do
		if [ $check -eq 0 && $a{[$k]} -eq 0 ]
		then
			echo "--------Completed Tasks--------"
			check=1
		fi
		echo "$(($k+1)):$l{[$k]} $a{[$k]}"
	done
fi

if [ $flag -eq 1 ]
then
	echo "Wrong command usage."
	echo "See command usage here: http://tinyurl.com/lab-7-task"
fi	
