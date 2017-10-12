#!/bin/bash
cd Downloads
while [ 1 ]
do
for a in *.tar
do
tar -xzvf $a -C ~/uncompressed
done
break
done

