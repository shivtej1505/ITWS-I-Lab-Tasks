#!/bin/bash
while [ true ]
do
cd ~/Downloads
for a in `find -iname "*.tar"`
do
tar -xf "$a" -C ~/uncompressed
rm "$a" 
done
done
