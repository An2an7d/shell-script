#!/bin/bash

Hello(){
	echo "Hello!!! $1"
	echo "Script Name: $0"
	echo "No of Args: $#"
	echo "All args are: $@"
}

echo "Before calling function: checking name: $1"
Hello $1
echo "No of Args: $#"
echo "All args are: $@"

#Parameters passed to the script are by default not accessible inside function