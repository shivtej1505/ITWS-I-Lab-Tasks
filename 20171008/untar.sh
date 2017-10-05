#!/bin/bash
mkdir ~/uncompressed/
while :
do
	list="$(find $HOME/Downloads/ -name "*.tar*")"
	for file in $list
	do
		if [ -e "$file" ]
		then
			tar -xf $file -C "$HOME/uncompressed"
			rm -f $file
		fi
	done
done
