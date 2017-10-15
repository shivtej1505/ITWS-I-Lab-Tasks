#!/bin/bash
	if [ "$1" == -'A' ]
	then
		echo $2 $3 >> todo.txt
	elif [ "$1" == -'T' ]
	then
		cat -b todo.txt | head -5
	elif [ "$1" == -'W' ]
	then
		cat -b todo.txt
	elif [ "$1" == -'-P' ]
	then	
		count=1
		for((k = 1 ; k<=`cat todo.txt | wc -l` ; k++))
		do
			if [ `sort -r -k 2 todo.txt|sed -n "${k}p"` == 0 ]
			then
				break
				
			fi
				echo `$k sort -r -k 2 todo.txt|sed -n "${k}p">`
				count=$((k + 1))
		done
		echo -------Completed Tasks-------

		for((i = 1 ; i<=`cat todo.txt | wc -l` ; i++))
		do 
			if [ `sort -r -k 2 todo.txt|sed -n "${i}p"` == 0 ] 
			then
				echo `$count sort -r -k 2 todo.txt|sed -n "${count}p>"`
				count=$((count + 1))
			fi
		done	

#		echo $1 | grep -n "0$"
	elif [ "$1" == -'d' ]
	then 
		ask=`sort -k 2 todo.txt | sed -n "${2}p"`
		echo $ask
		echo "Do you really want to delete $ask? [Y/N]"
		read binaryanswer
		if [ "$binaryanswer" == "N" ]
		then
			echo Deletion cancelled
		fi

		if [ "$binaryanswer" == "Y" ]
		then
			echo deleting task $2
			deletion=`sort -r -k 2 todo.txt|sed -n "${2}p>"`
			sed -i '/$deletion/d' todo.txt
		fi

		 count=1
                  for ((k = 1 ; k<=`cat todo.txt | wc -l` ; k++))
                  do
                          if [ `sort -r -k 2 todo.txt|sed -n "${k}p"` == 0 ]
                          then
                                  break
 
                          fi
                                  echo `$k sort -r -k 2 todo.txt|sed -n "${k}p">`
                                 count=$((k + 1))
                  done
                  echo -------Completed Tasks-------
			for((i = 1 ; i<=`cat todo.txt | wc -l` ; i++))
                  do
                          if [ `sort -r -k 2 todo.txt|sed -n "${i}p"` == 0 ]
                          then
                                  echo `$count sort -r -k 2 todo.txt|sed -n "${count}p>"`
 					count=$((count + 1))
                         fi
                 done
                 ;;

	elif [ "$1" == -'c' ]
	then
		completed=`sort -k 2 todo.txt | sed -n "${2}p"`
		firstfield=`sort -k 2 todo.txt | sed -n "${2}p"|cut -d ' ' -f1`
		sed -i "/$completed/c $firstfield 0" todo.txt
		echo Marking task $2 completed 
		;;
	elif [ "$1" == -'D' ]
	then
		echo "Are you sure you want to delete all the to-dos? [Y/N]"
		read answer
		if [ "$answer" == "N" ]
		then
			echo Action aborted
		fi
		if [ "$answer" == "Y" ]
		then
			rm todo.txt
			touch todo.txt
			echo List deleted 
		fi
	else 
		echo Wrong command usage
		echo See command usage here: http://tinyurl.com/lab-7-task
	fi


