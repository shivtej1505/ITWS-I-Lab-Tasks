#!/bin/bash
while [ 1 ];
do
if [ -f "~/Downloads/*.tar" ];
then
for i in 'ls ~/Downloads/*.tar'
			  do
			  echo "uncompressing a file"
			  tar -C ~/uncompressed -xvf $i
			  `rm -rf *.tar`
			  done
fi
done
