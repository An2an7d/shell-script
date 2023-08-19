#!bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "you need to be a root user to execute this script"
	exit 1
fi

yum install git -y

if [ $? -ne 0 ]; then
    echo "git installation is failed"
	exit 1
else
    echo "git is installed"
fi

