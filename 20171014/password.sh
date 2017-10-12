#!/bin/bash

 echo "please enter password"
 
 

 read -t 5 password

  if [ $? -ne 0 ]
 
  then
     echo "no input"
  
  fi

  
     if [ "$password" == "itws" ]
 
 then

 echo "coreect"

 else 
  
echo "Wrong Password :Say GoodBye to your PC"


 
fi 
