#!/bin/bash

word=$1
if [ -z $word ];
then 
    echo "no string is given"
    exit 1
fi
reverse=""
for ((i=${#word}-1;i>=0;i--))
do
    reverse+=${word:$i:1}
done
echo $reverse
if [ $reverse = $word ];
then 
    echo "palindrome"
else
    echo "not a palindrome"
fi