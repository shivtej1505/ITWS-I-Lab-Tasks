#!/bin/bash

touch todo.txt


case "$1" in
        -A)
            echo "$2 $3">>todo.txt
            ;;

        -T)
            #cat todo.txt|sort -g -k 2|head -5
            sort -r -k 2 todo.txt|head -5|nl -s " "
            ;;

        -W)
            cat todo.txt|nl -s " "
            ;;
        -P)
            flag=0
            sort -r -k 2 todo.txt|head -5|nl -s " "|while read line;
            do
               if [ $flag -eq 0 ];
                then
                if [ `echo "$line"| cut -d " " -f 3` == "0" ]
                 then
                    echo -------Completed Tasks-------
                    flag=1
                fi
               fi
               echo $line
            done
            ;;
        -d)#working
        todelete=`cat todo.txt|head -"$2"|tail -1`
        echo Do you really want to delete:"$todelete"?"[Y/N]"
        read response
        if [ "$response" == "Y" ] 
        then
            echo Deleting Task "#"$2
            sed -i "$2d" todo.txt
        fi
            
         ;;
       -D)
       echo Are you sure?"[Y/N]"
       read response
       if [ "$response" == "Y" ]
         then
             rm todo.txt
       fi
       ;;
       -c)
       completed=`cat todo.txt|head -"$2"|tail -1`
       echo "$completed"
       echo Marking task "$2" completed...
       replace=`echo "$(echo $completed|cut -d ' ' -f 1) 0"`
       sed -i "s/$completed/$replace/g" todo.txt
       #vi -c '%s/"$completed"/"$replace 0"/g' my.txt -c 'wq'
       ;;

esac
