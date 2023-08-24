#!/bin/bash

# develop a script that reverses the order of characters in each line of a text file.

nline=''
while read line
do 
    for ((i=${#line}-1;i>=0;i--))
    do
        nline+=${line:$i:1}
    done
    nline+="\n"
done < file.txt
echo -e "$nline"

#----------------------------------------
nline=''
mkdir test
while read line
do 
    for ((i=${#line}-1;i>=0;i--))
    do
        nline+=${line:$i:1}
    done
    echo $nline >> $PWD/test/reverse.txt
    nline=''
done < file.txt
