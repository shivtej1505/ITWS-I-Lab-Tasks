#!/bin/bash

cd ~/Downloads
while [ true ]
do	
	for i in `find -name *.tar`
	do
		tar -xvf $i -C ~/uncompressed
		rm -rf $i
	done
done


