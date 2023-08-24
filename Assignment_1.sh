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
while read line
do 
    for ((i=${#line}-1;i>=0;i--))
    do
        nline+=${line:$i:1}
    done
    echo $nline >> $pwd/test/reverse.txt
    nline=''
done < file.txt

# develop a script that takes a text file and replaces all occurences of 
# a specific word or phrase with another word or phrase.
# write a script that reads a text file and generates a list of words with
# their frequencies. Bonus points for sorting the list by frequency.