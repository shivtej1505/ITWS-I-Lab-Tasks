#!/bin/bash


while [ 1 ]
do
    for i in `find ~/Downloads -name "*.tar"`
        do
        tar -xvf $i -C ~/uncompressed
        rm $i

    
        done
done


    
