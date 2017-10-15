#!/bin/bash

count=1
flag=1
n=`cat to_do.txt | wc -l`
case "$1" in
	-A) echo "$2 $3" >> to_do.txt
		;;
	-T) for ((i=1 ; i<=5 ; i++))
		do
			if [ $i -le $n ]
			then
			echo "$i `cat to_do.txt | head -$i | tail -1`"
			fi
		done
		;;
	-W) for (( i=1 ; i<=n ; i++ ))

		do
			 echo "$i `cat to_do.txt | head -$i | tail -1`"
		done
		;;
	-P) nam=(`cat to_do.txt | sort -k 2 -r`)
		for (( i=0 ; i<2*n ; i=i+2 ))
		do
			c=`echo ${nam[$i +1]}`
				if [ $c -ne 0 ] 
			then
				echo " $(((i+2)/2)) ${nam[$i]} ${nam[$((i+1))]}"
			else
				if [ $flag == 1 ]
				then
					flag=0
					echo "-----------Completed Tasks----------"
					echo " $(((i+2)/2)) ${nam[$i]} ${nam[$((i+1))]}"
				else
					echo " $(((i+2)/2)) ${nam[$i]} ${nam[$((i+1))]}"
				fi
			fi
		done
		
		;;
		-d)echo `cat to_do.txt | head -$2 | tail -1`
		   echo "Do you really want to delete `cat to_do.txt | head -$2 | tail -1`?[Y/n]"
		   read ans
		   case $ans in
		   	Y) sed -ie "$2d" to_do.txt
				echo "deleting task $2"
	
				nam=(`cat to_do.txt | sort -k 2 -r`)
				for (( i=0 ; i<2*(n-1) ; i=i+2 ))
				do
					c=`echo ${nam[$i +1]}`
					if [ $c -ne 0 ] 
					then
						echo " $(((i+2)/2)) ${nam[$i]} ${nam[$((i+1))]}"
					else
						if [ $flag == 1 ]
						then
							flag=0
							echo "-----------Completed Tasks----------"
							echo " $(((i+2)/2)) ${nam[$i]} ${nam[$((i+1))]}"
						else
							echo " $(((i+2)/2)) ${nam[$i]} ${nam[$((i+1))]}"
						fi
					fi
				done
			;;
			n)echo"Action aborted"
			;;
		  esac
			
		;;
		-D)echo "Do you really want to delete all the to-dos?[Y/n]"
		   read ans
			case $ans in
		   	Y) for (( i=1 ; i<=n ; i++ ))
				do
				echo $i
				sed -ie "1d" to_do.txt
				done
				echo "deleting all task"
				;;
			n) echo "Action aborted"
			  ;;
		  esac
		;;

		-c)echo `cat to_do.txt | head -$2 | tail -1`
			change=(`cat to_do.txt | head -$2 | tail -1`)
			e=${change[0]}
			f=${change[1]}
			sed -ie "/^$e/ s/$f/0/" to_do.txt
			echo "marking ${change[0]} completed"
			;;

		*) echo "wrong command usage"
			echo "See command usage here: http://tinyurl.com/lab-7-task"
			;;
esac

