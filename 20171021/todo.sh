#!/bin/bash
lastserial=`cat last.txt`
function swap () {
awk ' { t = $1; $1 = $3; $3 = t; print; } ' todo.txt
}
#lastserial=`cat todo.txt|head -1`
if [ "$1" == "-A" ]
then
echo "$3 $2 $((lastserial + 1))" >> todo.txt
echo $((lastserial + 1)) > last.txt
fi
if [ "$1" == "-T" ]
then
swap | head -5
fi
if [ "$1" == "-W" ]
then
swap
fi
if [ "$1" == "-P" ]
then
cat todo.txt | sort -nr|awk ' { t = $1; $1 = $3; $3 = t;if ($3 > 0)
printf("%s:%s %s\n",NR,$2,$3); } '
echo "-------COMPLETED TASKS-------"
cat todo.txt | sort -nr|awk ' { t = $1; $1 = $3; $3 = t;if ($3 < 1)
 printf("%s:%s %s\n",NR,$2,$3); } '
fi
