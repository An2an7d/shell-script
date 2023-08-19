#!/bin/bash

USERID=$(id -u)
DATE=$(date +%F-%H-%M-%S)
LOG="jekins_install-${DATE}.log"
R="\e[31m"
G="\e[32m"
N="\e[0m"

if [ $USERID -ne 0 ]; then
	echo -e "${R} You need to be root user to execute this script ${N}"
	exit 1
fi

VALIDATE(){
if [ $1 -ne 0 ]; then 
	echo -e "$2 ... ${R}FAILED${N}" 2>&1 | tee -a $LOG
	exit 1
else
	echo -e "$2 ... ${G}SUCCESS${N}" 2>&1 | tee -a $LOG
fi
}

yum update -y &>>$LOG

VALIDATE $? "Updating yum"

wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo &>>$LOG
	
VALIDATE $? "Adding jenkins Repo"

rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key &>>$LOG

VALIDATE $? importing Jenkins key

yum upgrade -y &>>$LOG

VALIDATE $? "Upgrading yum"	

dnf install java-11-amazon-corretto -y &>>$LOG

VALIDATE $? "openjdk11 installation"

yum install jenkins -y &>>$LOG

VALIDATE $? "Installing Jenkins"

systemctl enable jenkins &>>$LOG

VALIDATE $? "Enabling Jenkins"

systemctl start jenkins &>>$LOG

VALIDATE $? "Starting Jenkins"

lss -ltr &>>$LOG

VALIDATE $? "Creating Error" 