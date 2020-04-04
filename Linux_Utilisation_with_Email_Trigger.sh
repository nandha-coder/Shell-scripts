#!/bin/bash
## CPU Utilisation & Memory Utilisation
## DATE: 4th April 2020
## Author: Nandhakumar Madheshwaran
#COLOR CODES
NOCOLOR="\e[39m"
RED="\e[31m"
YELLOW="\e[33m"
GREEN="\e[32m"

#VARIABLE DECLARATIONS
SERVER_HOSTNAME=`uname -n`
ADMIN_EMAIL_ID=root@localhost
DATE=$(date "+%F %H:%M:%S")
CPUUSAGE=$(sar -u 3 3 | grep -i Average | awk '{print $NF}')
MEMUSAGE=$(sar -r 3 3 | grep Average: | awk '{print $4}')

#To convert decimal point Value to integer
SAR_CPU=${CPUUSAGE/.*}
SAR_MEM=${MEMUSAGE/.*}

########## CPU conditions ########
if [ $SAR_CPU -le 10 ]
then
printf "${RED}CRITICAL ${NOCOLOR} CPU Usage : ${SAR_CPU}%% Idle ${DATE}\n" >> /opt/cpu.out
tail -n5 /opt/cpu.out > /tmp/cpuusage.tmp
echo Sending Email....
mail -s "CPU Utilization of ${SERVER_HOSTNAME}" "$ADMIN_EMAIL_ID" < /tmp/cpusage.tmp


elif [ $SAR_CPU -ge 10 ] && [ $SAR_CPU -le 20 ]
then
printf "${YELLOW}WARNING ${NOCOLOR} CPU Usage : ${SAR_CPU}%% Idle ${DATE}\n" >> /opt/cpu.out
tail -n5 /opt/cpu.out > /tmp/cpuusage.tmp
echo Sending Email....
mail -s "CPU Utilization of ${SERVER_HOSTNAME}" "$ADMIN_EMAIL_ID" < /tmp/cpusage.tmp

else
printf "${GREEN}OK ${NOCOLOR} CPU Usage : ${SAR_CPU}%% Idle ${DATE}\n" >> /opt/cpu.out
fi
printf ""
########## memory conditions ########
if [ $SAR_MEM -ge 90 ]
then
printf "${RED}CRITICAL ${NOCOLOR} Mem Usage : ${SAR_MEM}%% Used ${DATE}\n" >> /opt/mem.out
tail -n5 /opt/mem.out > /tmp/memusage.tmp
echo Sending Email....
mail -s "Mem Utilization of ${SERVER_HOSTNAME}" "$ADMIN_EMAIL_ID" < /tmp/memusage.tmp

elif [ $SAR_MEM -ge 80 ] && [ $SAR_MEM -le 90 ]
then
printf "${YELLOW}WARNING ${NOCOLOR} Mem Usage : ${SAR_CPU}%% Used ${DATE}\n" >> /opt/mem.out
tail -n5 /opt/mem.out > /tmp/memusage.tmp
echo Sending Email....
mail -s "Mem Utilization of ${SERVER_HOSTNAME}" "$ADMIN_EMAIL_ID" < /tmp/memusage.tmp
else
printf "${GREEN}OK ${NOCOLOR} Mem Usage : ${SAR_MEM}%% Used ${DATE}\n" >> /opt/mem.out
fi
