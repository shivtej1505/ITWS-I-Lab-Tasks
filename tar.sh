#!/bin/bash
cd ~/Downloads
while [ 1 ]
do
for a in `ls|grep .*.tar$`
do
echo $a
tar -xvf $a -C ~/uncompressed
done
break
done




