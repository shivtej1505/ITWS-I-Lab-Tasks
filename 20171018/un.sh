#!/bin/bash

while [ true ]
do
	for arc in `find ~/Downloads -name "*.tar"`
	do
		tar -xC ~/uncompressed/ -vf $arc			
		rm $arc
	done
done
