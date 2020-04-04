#!/bin/bash
## This script is used to mount Windows shared folder in Unix/Linux server
## 
## Usage : ./Mount_Windows_Share_in_Unix_Server.sh
##
## DATE: 4th April 2020
## Author: Nandhakumar Madheshwaran

#color defenition
NOCOLOR="\e[39m"
RED="\e[31m"
YELLOW="\e[33m"
GREEN="\e[32m"
BLUE="\e[34m"
MAGENTA="\e[35m"

if yum list installed cifs-utils >/dev/null 2>&1; then
{
printf "\n$YELLOW Enter the IP Address of your Windos machine : "
read IPA
printf "\n"
printf "\n Enter the username :"
read USR
printf "\n"
printf "\n$Which share needs to be mounted D / H / E: "
read DRV
printf "\n$MAGENTA Mounting the $DRV share under /mnt mount point in this server......$NOCOLOR\n\n"
sleep 1
mount -t cifs -o username=$USR //$IPA/$DRV /mnt
printf "\n"
sleep 1
}
else
printf "\n$YELLOW CIFS-Utils Pakage is not Installed in your machine. Please get it Installed.\n"
printf "\n$MAGENTA Example :$NOCOLOR yum install cifs-utils -y \n"
exit 1
fi
