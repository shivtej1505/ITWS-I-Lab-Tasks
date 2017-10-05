#!/bin/bash

cd ~/Download

while [ 1 ]
do
for CompFile in `find -iname "*.tar"`
do

tar -xvf "$CompFile" -C ~/uncompressed

rm "$CompFile"

done
done
