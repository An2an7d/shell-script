#!/bin/bash
LOGDIR=/tmp
DATE=$(date +%F:%H:%M:%S)
SCRIPT_NAME=$(basename "$0" | sed 's/[^A-Za-z0-9_.-]/_/g')
LOGFILE=$LOGSDIR/$SCRIPT_NAME-$DATE.log

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

DISK_USAGE=$(df -hT | grep -vE 'tmpfs|Filesystem')
DISK_USAGE_THRESHOLD=1
message=""

#IFS= means internal feild seperator is space.
while IFS= read line
do
    # this command will give you usage in number format for comparision
    usage=$(echo $line | awk '{print$6}' | cut -d % -f1)
     # this command will give us partition
    partition=$(echo $line | awk '{print$1}')
    if [ $usage -gt $DISK_USAGE_THRESHOLD ]
    then
        message+="High Disk Usage on $partition: $usage"
    fi
done <<< $DISK_USAGE
#echo "$message" | mail -s "High Disk Usage" venkatanandn@gmail.com
sh mail.sh venkatanandn@gmail.com "High Disk Usage" "$message" "DEVOPS TEAM" "High Disk usage"