#!/bin/bash

flag=$1
#echo "$flag"

if [ "$flag" == "-A"  ]
then
 
if [ "$#" -ne "3" ]
then
   echo "incorrect no of arguments"
   exit 0
fi

task=$2
prio=$3 

echo "$2 $3">>list.txt

fi
#------------------------------------------------------------

if [ "$flag" == "-T" ]
then
     cat -n list.txt|head -5
fi

#----------------------------------------------------------

if [ "$flag" == "-W" ]
then
    cat -n list.txt
fi

#-----------------------------------------------------------------

if [ "$flag" == "-P" ]
then
  n=$( cat list.txt|wc -l )
  zstart=-1

 for (( i=1; i<=n; i++ ))
 do
   pri=$( cat list.txt|awk '{ print $2 }'|sort -nr|head -$i|tail -1 )
   
#   echo "pri is $pri"
 
   if [ "$pri" -eq "0" ] 
   then
      zstart=$i 
     break
   fi 
 done
# echo "zstart is $zstart"


for (( k=1; k<zstart; k++ ))
do
 
 taskname=$( cat  list.txt|sort -k2 -nr|head -$(( zstart -1 ))|head -$k|tail -1|awk '{ print $1 }' ) 
 p=$( cat  list.txt|sort -k2 -nr|head -$(( zstart -1 ))|head -$k|tail -1|awk '{ print $2 }' )
 echo " $k: $taskname $p " 

 #echo "-----Completed Tasks-----"
 #cat -b list.txt|sort -k3 -nr| tail -$(( n - zstart )) 

done

        echo "-----Completed Tasks-----"
l=0
for (( k=1; k<=(n-zstart+1); k++ ))
do
  
 name=$( cat  list.txt|sort -k2 -nr|tail -$(( n - zstart ))|head -$k|tail -1|awk '{ print $1 }' )
  pi=$( cat  list.txt|sort -k2 -nr|tail -$(( n - zstart ))|head -$k|tail -1|awk '{ print $2 }' )
 
 echo " $(( zstart + l )): $name $pi "
 l=$(( l + 1 ))
done

fi

#-----------------------------------------------------------------------------------------------------

if [ "$flag" == "-d"  ]
then
  col=$2
name=$( cat list.txt|head -$col|tail -1|awk '{ print $1 }' ) 
pri=$( cat list.txt|head -$col|tail -1| awk '{print $2 }'  )

echo " Do you really want to delete '$name $pri' ? [Y/n] "

read response

if [ "$response" == "Y" ]
then
    sed -i "$col d;$col d" list.txt
else
   :
fi
fi

#---------------------------------------------------------------------------------------------------------
   
if [ "$flag" == "-C" ]
then
  ol=$2
  #name=$( cat list.txt|head -$col|tail -1 )
  pri=$( cat list.txt|head -$ol|tail -1|awk '{print $2}' )
  echo "$pri" 
  sed -e "$ol s/$pri/0/g" list.txt
fi


  


 








  
