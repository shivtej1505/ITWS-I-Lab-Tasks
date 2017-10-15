#!/bin/bash
case $1 in 
        -A) 
	    echo " $2 $3 " >> todo.txt
	 ;;
	 -T)
	       cat todo.txt | nl
	  ;;
	 -W)
	       cat todo.txt | head -5 | nl
	  ;;
         -P)
	 n='cat todo.txt | wc -l'
	 for i in 'seq 1 $n'
	 do
	  x='cat todo.txt | sort  -k2 -r | tail -1 | cut -d ' ' -f2'
	  if ((x>0))
	  then 
	  echo -----------Completed Tasks-------------
	     c=i
	  fi
	  echo "cat todo.txt | sort -k2 -r | head -$i | tail -1 | nl -s ':'"
	  ;;
	  esac
