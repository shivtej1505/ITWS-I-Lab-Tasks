#!/bin/bash
cd ~/Downloads
z=0
x=`ls ~/Downloads|grep ".tar"`
while [ 1 -gt 0 ]
do
x=""
until [ "$x" != "" ]
	do
	x=`ls ~/Downloads|grep ".tar"`
	z=1
	done
if [ "$z" -ne 0 ]
then
y=`ls ~/Downloads|grep ".tar"`
tar -xvf $y --directory ~/Downloads/uncompressed/
rm $y
z=0
fi
done
