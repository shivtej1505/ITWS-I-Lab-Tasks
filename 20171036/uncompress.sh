#!/bin/bash
while :
do
for i in `ls ~/Downloads/*.tar`
do
tar -C ~/uncompressed -xvf $i
`rm -rf $i`
done
done
