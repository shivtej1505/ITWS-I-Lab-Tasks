#!/bin/bash

read -t 10 pass
password="ajay123"
if [[ "$pass" == "$password" ]]; then
echo "Password accepted"
else 
echo  "Timeout error"
fi
