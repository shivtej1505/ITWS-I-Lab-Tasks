#!/bin/bash
#Untar the file

cd ~/Downloads
while [ 1 ]
   do
   if [ -f *.tar.gz ]
   then
   for d in *.tar.gz
   do
      tar -xf "$d" -C ~/uncompressed
      rm $d
   done
   else
        echo tar: No such file exists
   fi
done
