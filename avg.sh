#!/binbash

for ((i=1;i<=$#;i++))
do
	sum=`echo "scale=4;$((sum + $i))" | bc`
done

echo -n "average:";echo "scale=4;$sum/$#" | bc
