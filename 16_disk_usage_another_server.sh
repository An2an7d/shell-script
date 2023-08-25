#!/bin/bash

 sshpass -p "password" ssh username@ip_address df -hT 
 | awk 'NR == 1 || NR == 2 || NR == 4 {printf "%-15s %-10s %-10s %-10s\n", 
 $1, $5, $6, $7}'