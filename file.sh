#!/bin/bash
mkdir ~/uncompressed
cd ~/Downloads
while [ 1 ]
do
k=$( find . -name "*.tar" | wc -l)
if [$k -ge 1 ]
then
    echo "uncompressing a file"
tar -xvf *.tar -C ~/uncompressed 
   rm -rf *.tar;
fi
done
