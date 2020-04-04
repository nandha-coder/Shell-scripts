#!/bin/bash

## Count down timer
## Usage : ./countdown_timer.sh
## DATE: 4th April 2020
## Author: Nandhakumar Madheshwaran

printf "\n Please provide the time :"
read tme
for (( i=$tme; i>0; i--))
do
sleep 1 &
printf "  $i \r"
wait
done
