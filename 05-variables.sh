#!bin/bash

SDATE=$(date)
echo "execution started at $SDATE"

echo -n "Enter Username:"
read -s USERNAME

echo

echo -n "Enter password:"
read -s PASSWORD

echo

echo "Username: ${USERNAME}"
echo "password: ${PASSWORD}"

EDATE=$(date)
echo "execution ended at $EDATE"