#!/bin/bash
cd Downloads
while [ 1 ]
do
for file in *.tar
do
tar zxvf "$file" -C ~/uncompressed
done
break
done


