#!/bin/bash

<<comment
loop example
for i in {1..100}
do
    echo $i
done
comment
<<algorithm
user should have root acess
while instaling store the logs
implement colors for user experience
before installing it, always check whether the package is installed or not
if installed skip, otherwise process for installation
check successfully installed or not
algorithm
LOGDIR=/home/centos/log_files
SCRIPTNAME=$0
DATE=$(date +%F-%H-%M-%S)
logfile=$LOGDIR/$-$DATE.log
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

if [ USERID -ne 0 ];
then
    echo -e "$R you should be a root user to install this $N"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ];
    then
        echo -e "Installing $2... $R Failure $N"
        exit 1
    else
        echo -e "Installing $2... $G Success $N"
    fi
}

for j in $@
do
    yum list installed $j &>>logfile
    if [ $? -ne 0 ];
    then
        echo "$j is not installed. Let's install it"
        yum install $j -y &>>logfile
        VALIDATE $? $j
    else
        echo -e "$Y $j is already installed $N"
        exit 1
    fi
done