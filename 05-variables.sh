#!bin/bash

DATE=$(date)
echo "execution started at $DATE"

echo -n "Enter Username:"
read -s USERNAME

echo

echo -n "Enter password:"
read -s PASSWORD

echo

echo "Username: ${USERNAME}"
echo "password: ${PASSWORD}"

echo "execution ended at $DATE"