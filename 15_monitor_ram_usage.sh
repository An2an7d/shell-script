#!/bin/bash

# monitor RAM usage through free command and send email if it is more than threshold.
DATE=$(date +%F)
LOGSDIR=/tmp
# /home/centos/shellscript-logs/script-name-date.log
SCRIPT_NAME=$0
LOGFILE=$LOGSDIR/$0-$DATE.log
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

if [ $USERID -ne 0 ];
then
    echo -e "$R ERROR:: Please run this script with root access $N"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ];
    then
        echo -e "$2 ... $R FAILURE $N"
        exit 1
    else
        echo -e "$2 ... $G SUCCESS $N"
    fi
}

total_ram=$( free -m | awk '/Mem:/ {print $2}' )
free_ram=$( free -m | awk '/Mem:/ {print $4}' )
ram_threshold=300
message=""

if [ "$free_ram" -lt "$ram_threshold" ]; then
    message+="Total RAM: $total_ram"$'\n'
    message+="Free RAM: $free_ram"$'\n'
    message+="RAM is below threshold limit. Please make necessary changes"
fi

echo "$message" | mail -s "Critical RAM" venkatanandn@gmail.com