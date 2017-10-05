#!/bin/bash

  
  
   while :
 do
   name=`find ~/Downloads -name '*.tar'|cut -d" " -f 1|head -1`
  
  if [ "$name" == "" ]
  then
    
       continue
  fi
   
   echo "$name is uncompressed and deleted"
 
   tar -xvf $name --directory ~/uncompressed
  
   rm $name

  done
