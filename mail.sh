#!/bin/bash

TO_ADDRESS=$1
SUBJECT=$2
BODY=$(sed -e 's/[]\/$*.^[]/\\&/g' <<< $3)
TEAMNAME=$4
ALERTTYPE=$5

FINAL_BODY=$(sed -e "s/TEAMNAME/$TEAMNAME/g" -e "s/ALERTTYPE/$ALERTTYPE/g" -e "s/BODY/$BODY/" template.html)

echo "$FINAL_BODY" | mail -s $"(echo -e "$SUBJECT\nContent-Type: text/html")" "$TO_ADDRESS"