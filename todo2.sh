#!/bin/bash
serno=0;taskname=$2;priority=$3
A (){
	#taskname=$2;priority=$3
	echo "$taskname $priority"|cat>>todo1.sh
}
T (){
	for i in {1..5}
	do
		todo=`cat todo1.sh|head -$i|tail -1`
			echo "$i $todo"
	done
}
W (){
	serno=1
         while read -r line
         do
                 if [[ "$line" =~ [^[:space:]] ]]
                 then
                 readline="$line"
		 echo "$serno $line"
                 serno=$((serno+1))
		 fi
	done< "todo1.sh"
}
P (){
	serno=1
		cat todo1.sh|awk '{print $2"\t"$1}'|column -t|sort -n>tmp.sh
		cat tmp.sh|awk '{print $2"\t"$1}'|column -t>tmp1.sh
		while read -r line
		do
		if [[ "$line" =~ [^[:space:]] ]]
		then
		readline="$line"
		echo "$serno $readline"
		serno=$((serno+1))
		fi
		done< "tmp1.sh"
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
then
	P
	fi
