#!/bin/bash
## Script to show rotating cursur for the time being
## Time should be mentioned as a arguement
## Usage syntax       ./rotate.sh time(Seconds)

## DATE: 4th April 2020
## Author: Nandhakumar Madheshwaran


#Color Defenition
MAGENTA="\e[35m"
BOLD="\e[1m"
NOCOLOR="\e[39m"
tme=$1
spin='\|/-\'

#Checking the Input Argument count
#If it is equal to 1
if [ $# -eq 1  ]
then
printf "$BOLD $MAGENTA"
for (( start = $1; start > 0; start-- ))
do
{
	for i in {1..4}
	do
	sleep 0.5 &
	printf "\r ${spin:$i:1} ${spin:$i:1} ${spin:$i:1}" & sleep 0.5
	done
let "tme=tme-1"
}
done
printf "\r$NOCOLOR"

#Input Argument is not equal to 1
else
echo "Wrong Syntax Usage : cursor_rotate.sh count[ in seconds]"
fi
