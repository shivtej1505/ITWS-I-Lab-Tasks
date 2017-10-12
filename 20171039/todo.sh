#!/bin/bash

case "$1" in
      -A) echo "$2 $3">>text.txt ;;
      -T)#cat text.txt | sort -t" " -k2 -nr | head -5;;
	      cat text.txt | sort -r -k 2 | head -5| nl -s "  ";;
	  -W)cat text.txt| nl -s "  ";;
	  -P)r=0 
	  cat text.txt | sort -r -k 2 | 
	  while read line
	  do 
         if [[ `echo $line | cut -d " " -f 2` -eq 0 ]] && [[ $r -eq 0 ]]
		 then
		 echo "--------completed tasks---------"
		 r=1
		 fi
		  echo "$line"
		 done;;
	   -d) 
           delete=`cat text.txt | head -"$2" | tail -1`
		   echo Do you really want to delete the file[Y/n]?
		   read answer
		   if [[ "$answer" -eq Y ]]
		   then
		   sed -i '/$delet/d' text.txt
		   fi
esac

