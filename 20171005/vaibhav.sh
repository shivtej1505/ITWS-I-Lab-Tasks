#!/bin/bash
while [ 17 -gt 0 ]
do
	var=`find ~/Downloads/ | grep ".tar" -F | wc -l`
	if [ "$var" -gt 0 ]
	then
		set `find ~/Downloads/ | grep ".tar" -F`
		for i in $*
		do
			tar -xvf "$i" -C ~/uncompressd/
		done
	else
		continue
	fi
done

