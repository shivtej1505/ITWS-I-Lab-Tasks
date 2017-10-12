#!/bin/bash

for i in ~/Downloads/*.tar
do
    tar -xvf "$i" -C ~/uncompressed    
done
