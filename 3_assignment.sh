#!/bin/bash

# write a script that reads a text file and generates a list of words with
# their frequencies. Bonus points for sorting the list by frequency.

sed -e  's/[^A-Za-z]/ /g' file.txt | tr 'A-Z' 'a-z' | tr ' ' '\n' | grep -v '^$'| sort | uniq -c | sort -rn