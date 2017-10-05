#!/bin/bash

for i in ~/Downloads/*.tar
do
	if [ -s $i ]
	then
		tar -xvf $i -C ~/uncompressed
	else
		echo "EMPTY"
	fi
done
