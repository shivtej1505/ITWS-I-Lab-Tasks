password=abc
echo "Enter the password"
read pass
if [ "$password" == "$pass" ]
then 
echo "Welcome"
else 
echo "Invalid"
fi
