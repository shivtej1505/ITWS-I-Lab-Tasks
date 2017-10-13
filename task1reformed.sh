#!/bin/bash
while [ 1 ]
do
	for i in `ls /home/user/Downloads/*.tar`
	do
		echo "Your file is extracting.Please Wait"
		tar -C /home/user/uncompressed -xvf $i
		`rm -rf $i`
	done
done
