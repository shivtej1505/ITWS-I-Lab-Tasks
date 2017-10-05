#!/bin/bash/
if [ -e "$HOME/uncompressed" ]
then
    :
else
    mkdir "$HOME/uncompressed"
fi

while :
do
    for i in $(find -name *.tar)
    do
        fname=`echo $(basename $i) | cut -d'.' -f1`

        if [ -e "$HOME/uncompressed/$fname" ]
        then 
            continue
        else
            echo "extracting $(basename $i)"
            mkdir "$HOME/uncompressed/$fname"
            tar -xf $i -C "$HOME/uncompressed/$fname/"
        fi
    done
done
