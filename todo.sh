#!/bin/bash

if [ "$1" == "-A" ]

then 



echo "$2-$3" >> list.txt


fi

if [ "$1" == "-T" ]

then

i=1
while read line

do 
echo "$i ) $line"
i=$(( i + 1 )) 
done< <(cat list.txt | head -5) 

fi

if [ "$1" == "-W" ]

then
j=1

while read sen
do
echo "$j ) $sen"

j=$(( j + 1 ))
done< <(cat list.txt) 

fi


z=1
if [ "$1" == "-P" ]

then

while read todo

do

com=`echo $todo | cut -d "-" -f2`


if [ $com == 3 ]
then

echo "$z ) $todo"

z=$(( z + 1 ))
fi


done< <(cat list.txt)



while read sen

do

comm=`echo $sen | cut -d "-" -f2`


if [ $comm == 2 ]
then

echo "$z ) $sen"

z=$(( z + 1 ))
fi
done< <(cat list.txt)



while read text

do

commm=`echo $text | cut -d "-" -f2`


if [ $commm == 1 ]
then

echo "$z ) $text"

z=$(( z + 1 ))
fi


done< <(cat list.txt)






while read textt

do

commmm=`echo $textt | cut -d "-" -f2`


if [ $commmm == 0 ]
then

echo "$z ) $textt"

z=$(( z + 1 ))
fi


done< <(cat list.txt)






fi
