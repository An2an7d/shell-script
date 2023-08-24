#!/bin/bash

# automate Gmail configuration in Linux server, prompt user for credentials.

LOGDIR=/tmp
DATE=$(date +%F:%H:%M:%S)
SCRIPT_NAME=$0
LOGFILE=$LOGSDIR/$SCRIPT_NAME-$DATE.log
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

if [ $USERID -ne 0 ];
then
    echo -e "$R you should be a root user to install this $N"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ];
    then
        echo -e "$2... $R Failure $N"
        exit 1
    else
        echo -e "$2... $G Success $N"
    fi
}

yum update -y --exclude=kernel* &>>logfile

VALIDATE $? "updating yum packages except kernel"

yum -y install postfix cyrus-sasl-plain mailx &>>logfile

VALIDATE $? "installing postfix and supporting files"

systemctl restart postfix &>>logfile

VALIDATE $? "restarting postfix"

systemctl enable postfix &>>logfile

VALIDATE $? "enabling postfix"

cat $PWD/postfix.config >> /etc/postfix/main.cf  

VALIDATE $? "adding postfix config"

touch /etc/postfix/sasl_passwd &>>logfile

VALIDATE $? "creating sasl_passwd"

echo -e "Instructions to enter username and password:
xyz is from xyz@gmail.com, password_app is from google management app password/n"

echo -n "Enter Username:"
read -s USERNAME &>>logfile

echo

echo -n "Enter password:"
read -s PASSWORD &>>logfile

echo

echo "[smtp.gmail.com]:587 $USERNAME:$PASSWORD" >> /etc/postfix/sasl_passwd

VALIDATE $? "Adding Gmail credentials for authentication"

postmap /etc/postfix/sasl_passwd &>> LOGFILE

VALIDATE $? "creating a postfix lookup table"

echo "This is a test mail & Date $(date)" | mail -s "message" venkatanandn@gmail.com

VALIDATE $? "mail sent"