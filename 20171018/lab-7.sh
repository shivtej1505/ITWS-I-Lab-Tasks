#!/bin/bash

err(){
	echo "wrong usage"
	echo "Refer to tinyurl.com/lab-7-task"
}
a(){
	echo "$2 $1" >> list.txt
	cat list.txt
}
compl(){
	n=`cat list.txt | wc -l`
	for ((i=0;i<$1 && i<n;i++))
	do
		pri=`head -n $((i+1)) < list.txt | tail -n 1 | cut -d ' ' -f1`
		nam=`head -n $((i+1)) < list.txt | tail -n 1 | cut -d ' ' -f2`
		echo -e "$((i+1)) $nam $pri"
	done
}
pret(){
	cat list.txt | sort -r > tmp.txt
	n=`cat list.txt | wc -l`

	flag=0
	for ((i=0;i<n;i++))
	do
		pri=`head -n $((i+1)) < tmp.txt | tail -n 1 | cut -d ' ' -f1`
                nam=`head -n $((i+1)) < tmp.txt | tail -n 1 | cut -d ' ' -f2`
		if [ $flag -eq 0 -a $pri -eq 0 ]
		then
			flag=1
			echo "-------Completed Tasks-------"
		fi

		echo "$((i+1)):$nam $pri"	
	done
}

rem(){
	n=`cat list.txt | wc -l`
	if [ $1 -le $n ]
	then
		str=`head -n $1 < list.txt | tail -n 1`
		str1=`echo $str | cut -d ' ' -f2`
		str2=`echo $str | cut -d ' ' -f1`
		echo "$str1 $str2"
		echo "Are you really want to delete '$str1 $str2' ?[Y/n]"
		read resp

		if [ $resp == "Y" ]
		then
			echo "deleting '$str1 $str2'"
			sed "$1d" list.txt > tmp.txt
			cat tmp.txt > list.txt
		elif [ $resp == "n" ]
		then
			echo "Action aborted"
		else err
		fi
	else
		err
	fi
}

dall(){
	echo "Are you really want to delete all to-dos?[Y/n]"
	read resp

	if [ $resp == "Y" ]
        then
               rm list.txt
	       touch list.txt
	elif [ $resp == "n" ]
	then
		echo "Action aborted"
	else
		err
	fi
}
c(){
	n=`cat list.txt | wc -l`
	if [ $1 -le $n ]
	then	
		str=`head -n $1 < list.txt | tail -n 1`
		str1=`echo $str | cut -d ' ' -f2`
        	str2=`echo $str | cut -d ' ' -f1`
		echo "$str1 $str2"
	
		echo "marking task $1 complete"
		rstr=`echo "0 $str1"`
		sed "s/$str/$rstr/g" list.txt > tmp.txt
        	cat tmp.txt > list.txt
	else
		err
	fi
	#echo "0 $str1" >> list.txt

}


case $1 in
"-A")
	if [ $# -ne 3 ]
	then
		err
	else
		a $2 $3
	fi
	;;
"-T")
	if [ $# -ne 1 ]
	then
		err
	else
		compl 5
	fi
	;;
"-W")
	if [ $# -ne 1 ]
	then
		err
	else
		compl `cat list.txt | wc -l`
	fi
	;;
"-P")
	if [ $# -ne 1 ]
	then
		err
	else
		pret
	fi
	;;
"-d")
	if [ $# -ne 2 ]
	then
		err
	else
		rem $2
	fi
	;;
"-C")
	if [ $# -ne 2 ]
	then
		err
	else 
		c $2
	fi
	;;
"-D")
	if [ $# -ne 1 ]
	then
		err
	else
		dall
	fi
	;;
*)
	err
	;;
esac
