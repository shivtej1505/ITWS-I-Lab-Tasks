#!/bin/bash
A()
{
	echo "$1 $2" >> todo.txt
}
T()
{
	cat todo.txt | head -n 5
}
W()
{
	i=1
	cat todo.txt | while read line
do
	echo "$i $line"
	i=$(( $i =1))
done
}
P()
{
	cat todo.txt|sort -n
}

