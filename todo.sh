#!/bin/bash
A ()
{
	echo "$2 $1 $2" >> todo.txt
}
T ()
{
	i=1
        cat todo.txt| head -n 5 | while read line
        do
                echo -n "$i "
                echo "$line" | awk '{ print $2, $3 }'
                i=$(( $i + 1 ))
	done
}
W ()
{
	i=1
	cat todo.txt | while read line
	do
		echo -n "$i "
		echo "$line" | awk '{ print $2, $3 }'
		i=$(( $i + 1 ))
	done
}
P ()
{
	i=1
	s=1
        cat todo.txt|sort -nr | while read line
        do
		po=`echo "$line" | awk '{ print $1 }'`
		if [ $po -eq 0 ]
		then
			if [ $s -eq 1 ]
			then
				echo "-------COMPLETED TASKS-------"
				s=$(( $s + 1 ))
			fi
		fi
                echo -n "$i:"
                echo "$line" | awk '{ print $2, $3 }'
                i=$(( $i + 1 ))
        done
}
d ()
{
	i=1
	s=$1
        cat todo.txt | while read line
        do
		if [ $i -ne $s ]
		then
                	echo "$line" > todo.txt
		fi
                i=$(( $i + 1 ))
        done
}
if [ $1 == "-A" ]
then
	A $2 $3
elif [ $1 == "-T" ]
then
	T
elif [ $1 == "-W" ]
then
	W
elif [ $1 == "-P" ]
then
	P
elif [ $1 == "-d" ]
then
	d $2
else 
	echo "Wrong Command"
fi
