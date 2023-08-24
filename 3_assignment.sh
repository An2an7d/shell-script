#!/bin/bash

# write a script that reads a text file and generates a list of words with
# their frequencies. Bonus points for sorting the list by frequency.

sed -e  's/[^A-Za-z]/ /g' file.txt | tr 'A-Z' 'a-z' | tr ' ' '\n' | grep -v '^$'| sort | uniq -c | sort -rn | awk '{print $2, $1}'
<<comment
sed replaces all non-character occurences with spaces
tr replaces capital letters with small and spaces with newline
grep -v '^$' gives us line excluding empty ones
uniq -c will count the multiple occurences of same word
sort -rn  -r: Reverse the order of sorting, so it will be in descending order.
          -n: Sort numerically, treating the counts as numbers.
comment