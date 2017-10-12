#!/bin/bash
while true
do
w=`ls -1 ~/Downloads/*.tar|wc -l` 
if [ $w -gt 0 ]
then		       
for f in ~/Downloads/*.tar
do
  tar -zxvf "$f" -C ~/Uncompressed
  rm "$f"
done
fi
done
