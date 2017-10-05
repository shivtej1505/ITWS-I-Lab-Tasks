#!/bin/bash
echo ' '
echo THE INTERNATIONAL CANNIBAL SOCIETY INVITES YOU TO DINNER
echo ' '
echo First though, enter the password:
password=iiit123
read -s word
echo ' '
if [ "$word" == "$password" ]
then 
echo Password correct. You are now part of dinner. Literally.
cd ~/Downloads
else
shutdown
yes ERROR-SYSTEM SHUTTING DOWN IN 60 SECONDS
fi
