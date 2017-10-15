#!/bin/bash

		
	if [ "$1"  == "-A" ]; 
	then
		echo "$2 $3" >> todolist.txt  
	fi

	if [ "$1"  == "-T" ]; 
        then
             cat -n todolist.txt|head -5
        fi
	  
      if [ "$1"  == "-W" ];
         then
              cat -n todolist.txt
         fi



	 if [ "$1"  == "-P" ];
	 then
		sort -r -k 2 todolist.txt > sorted.txt
		k=`grep -m 1 -n '0' sorted.txt`
		t=`echo $k|cut -d':' -f 1`	
		echo $t
		
		sed -i "${t}i ---- Completed Tasks -----  " sorted.txt	
		cat sorted.txt
	
	fi

	if [ "$1"  == "-d" ]
	then
	read -p "Do you really want to delete 'Task-$2' ? [Y/n] " i 			
		if [ "$i" == "Y" ]
		then 
		sed -i "/Task-$2/d" todolist.txt	
		fi
				
	fi		

	if [ "$1"  == "-c" ]
	then
		sed "s/Task-$2 .*/Task-$2 0/" todolist.txt
				
	fi		
	if  [ "$1" == "-D" ] 
	then
	read -p "DO you really want to delete all To-do ? [Y/N] " conf
		
		if [ "$conf" == "Y" ]
		then
			rm -rf todolist.txt		
			touch todolist.txt
		fi
	

	fi


	
