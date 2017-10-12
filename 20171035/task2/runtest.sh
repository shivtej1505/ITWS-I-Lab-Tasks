#!/bin/bash
echo $1>>num
echo $2>>text
paste num text >> test1
rm num text
