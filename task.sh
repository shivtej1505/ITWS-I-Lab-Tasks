#!/bin/bash
while [ 1 ] 
do
for i in `ls ~/Downloads/*.tar` 
			  do
			  tar -C ~/uncompressed -xvf $i  
			  rm $i 
			  done
 done
