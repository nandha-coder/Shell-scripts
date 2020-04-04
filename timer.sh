#!/bin/bash
printf "\n Please provide the time :"
read tme
for (( i=$tme; i>0; i--))
do
sleep 1 &
printf "  $i \r"
wait
done
