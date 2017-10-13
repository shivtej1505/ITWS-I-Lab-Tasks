#!/bin/bashi
case $1 in
	-W)
		counter=`cat todo.txt | wc -l`
		i=0
		while [ $i -lt $counter ]
		do
		printf  "%d " "$((i+1))"
		printf "`cat todo.txt | tail -n $((counter-i)) | head -n 1` \n"
		i=$((i+1))
		done
		;;
	-T)
		counter=`cat todo.txt | wc -l`
		i=0
		while [ $i -lt 5 ] && [ $i -lt $counter ]
		do
		printf  "%d " "$((i+1))"
		printf "`cat todo.txt | tail -n $((counter-i)) | head -n 1` \n"
		i=$((i+1))
                done

		;;
	-P)
		counter=`cat todo.txt | wc -l`
		i=1
		k=1
		flag=1
		while [ $i -le $counter ]
		do
		j=`cat todo.txt | sort -k2 | tail -n $i | head -n 1`
		if [ `echo $j | cut -d ' ' -f2` != 0 ]
		then
			printf  "%d %s \n" "$k" "$j"
		else 
			if [ "$flag" -eq "1" ]
			then
				echo "------completed tasks-------"
				printf  "%d %s \n" "$k" "$j"
				flag=0
			else [ "$flag" -eq "0" ]
				printf  "%d %s \n" "$k" "$j"
			fi
		fi
		k=$((k+1))
		i=$((i+1))
		done

		;;
	-A)
		echo $2 $3 | cat >> todo.txt
		;;
	-d)
		printf "`cat todo.txt | head -n $2 | tail -n 1` \n"
		echo " delete '`cat todo.txt | head -n $2 | tail -n 1`' ? [Y/n]"
		read x
		if [ $x == "Y" ]
		then
			echo "deleting task $2"
			sed -i "$2d;$2d" todo.txt
			echo "`bash task1.sh -P`"
		else 
			echo "`bash task1.sh -P`"
		fi
		;;
	-c)
		;;
esac
