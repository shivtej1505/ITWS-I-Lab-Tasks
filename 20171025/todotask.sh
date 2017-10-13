#!/bin/bash
case $1 in 
-A)
		echo "$2 $3" >> todolist.txt ;;
-T)
		nl todolist.txt | head -n 5 ;;
-W)
		nl todolist.txt ;;
-P)
		#printing the list in pretty format
		n=`cat todolist.txt | wc -l `
		for((i=1;i<=$n;i++))
		do
		if [ "$(cat todolist.txt | cut -d ' ' -f 2 | head -n $i | tail -1)" ==  "3" ];
			then
			echo `cat todolist.txt | head -n $i | tail -1`
			fi
		done
		
		for((i=1;i<=$n;i++))
                do
                        if [ "$(cat todolist.txt | cut -d ' ' -f 2 | head -n $i | tail -1)" == "2" ]
                        then
                        echo `cat todolist.txt | head -n $i | tail -1`
                        fi
                done

		for((i=1;i<=$n;i++))
                do
                        if [ "$(cat todolist.txt | cut -d ' ' -f 2 | head -n $i | tail -1)" == "1" ]
                        then
                        echo `cat todolist.txt | head -n $i | tail -1`
                        fi
                done

		echo "-------------Completed Tasks----------------"
		 for((i=1;i<=$n;i++))
                do
                        if [ "$(cat todolist.txt | cut -d ' ' -f 2 | head -n $i | tail -1)" == "0" ]
                        then
                        echo `cat todolist.txt | head -n $i | tail -1`
                        fi
                done

esac 
