#!/bin/bash
while(true)
do
for i in `find  ~/Downloads -name "*.tar"`
do
tar -xof $i -C ~/uncompressed
rm $i
done
done




