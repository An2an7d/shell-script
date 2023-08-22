#!/bin/bash

TO_ADDRESS=$1
SUBJECT=$2
BODY=$(sed -e 's/[\/$*.^]/\\&/g' <<< $3)
echo "escaped content: $BODY"
TEAM_NAME=$(sed -e 's/[\/$*.^]/\\&/g' <<< $4)
ALERT_TYPE=$(sed -e 's/[\/$*.^]/\\&/g' <<< $5)

FINAL_BODY=$(sed -e "s/MESSAGE/$BODY/g" -e "s/TEAM_NAME/$TEAM_NAME/g" -e "s/ALERT_TYPE/$ALERT_TYPE/g" template.html)

echo "$FINAL_BODY" | mail -s "$(echo -e "$SUBJECT\nContent-Type: text/html")" "$TO_ADDRESS"