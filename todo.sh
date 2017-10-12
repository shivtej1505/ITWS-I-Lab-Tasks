#!/bin/bash
line=$2
priority=$3

A() 
{
	echo "$line $priority"|cat >>todo1.sh
}
T()
{
	for i in {1..5}
	do
		
		line1=`cat todo.sh|head -$i|tail -1`
			echo "$i) $line1"
			done
}
W()
{
i=1
	while read -r line
do
	if [[ "$line" =~ [^[:space:]] ]]
	then
	line1="$line"
	echo "$i) $line1"	
	i=$((i+1))
	fi
done < "todo1.sh"

}
P()
{
i=1
cat todo1.sh|awk '{print $2"\t" $1}'|column -t|sort -n>tmp.sh
cat tmp.sh|awk '{print $2"\t"$1}'|column -t>tmp1.sh
while read -r line
do
	if [[ "$line" =~ [^[:space:]] ]]
	then
	line1="$line"
	echo "$i) $line1"	
	i=$((i+1))
	fi
done < "tmp1.sh" 

}
if [[ $1 == "-A" ]]
	then 
	A
	elif [[ $1 == "-T" ]]
	then 
	T
	elif [[ $1 == "-W" ]]
	then 
	W
	elif [[ $1 == "-P" ]] 
	P
fi
