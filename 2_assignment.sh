# develop a script that takes a text file and replaces all occurences of 
# a specific word or phrase with another word or phrase.
#!/bin/bash

word_to_find=line
word_to_replace=test

sed -i "s/$word_to_find/$word_to_replace/g" file.txt