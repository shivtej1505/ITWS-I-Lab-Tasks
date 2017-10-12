#!/bin/bash



function add(){

    `echo : $1 $2 >> todo.txt`
}
function t(){
    i=1
    head -5 todo.txt | while read a b c
        do
            echo $i $b $c
            i=$(( i + 1 ))
        done
}

function w(){
    i=1
    while read q e r
        do
            echo $i $e $r
            i=$(( i + 1 ))
        done<todo.txt

}

function p(){
    i=1
    while read w e r
        do
            echo $i $w $e $r >> to1.txt
            i=$((i + 1 ))
         done<todo.txt
    while read q w e r
        do
        if [ $r != 0 ]
        then
            echo $q $w $e $r >> sort.txt
        fi
       done<to1.txt
       sort -r -k 4 sort.txt
       truncate -s 0 sort.txt
       echo ------Completed Tasks-------
   while read q w e r
       do
       if [ $r == 0 ]
       then
           echo $q $w $e $r
       fi
       done<to1.txt
       truncate -s 0 to1.txt
        
}

function del(){
    i=1
    while read q w e
        do
            echo $i $q $w $e >> to1.txt
            i=$(( $i + 1 ))
        done<todo.txt
    while read a b c d
        do
            if [ $a == $1 ]
            then
                grep $d todo.txt | cut -d " " -f3
                echo Are you sure you want to delete?[Y/n]
                read x
                if [ $x == "Y" ]
                then
                    echo deleting `grep $d todo.txt | cut -d " " -f3`
                    grep -v "$d" todo.txt > temp.txt
                    mv temp.txt todo.txt
                fi
            fi
        done<to1.txt
       truncate -s 0 to1.txt
}
case "$1" in
    '-A')add $2 $3
            ;;
    '-T') t ;;
    '-W') w ;;
    '-P') p ;;
    '-d') del $2 ;;
esac
