#!/bin/bash
while true
do
	find . -name "*.tar.*" | while read i; do
		d=`tar -tf $i | head -1 | cut -d'/' -f1`
		if [ -e "$HOME/extracted/$d" ]
		then
			continue;
		else
			mkdir "$HOME/extracted/$d"
			tar -xvf "$i" -C "$HOME/extracted/$d/"	
			echo "extracted $i into $HOME/extracted/$d"
		fi
	done
done

