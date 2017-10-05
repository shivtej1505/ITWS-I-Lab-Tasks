#!/bin/bash

while [ true ]
do
	find ~/Downloads/ -name "*.tar" > fil
	n=`wc -l < fil`

	for ((i=1;i<=n;i++))
	do
		arc=`head -n $i < fil | tail -n 1`
		tar -xC ~/uncompressed/ -vf $arc
				
		rm $arc
	done
done
