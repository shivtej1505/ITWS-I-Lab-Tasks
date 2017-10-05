#!/bin/bash
while [ 1 ];
do
for i in `( ls ~/Downloads/*.tar )`;
do 
tar -xvf $i -C ~/uncompressed 
done
break
done


