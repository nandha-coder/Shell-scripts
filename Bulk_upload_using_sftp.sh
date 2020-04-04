#!/bin/bash
# Used to upload a file called File_A.txt to multiple remote Linux servers using SFTP
# Syntax is ./Bulk_upload_using_sftp.sh
# It will ask Username of remote server
# It will ask the server list in Bulk. Once entred one by one press CTRL+D 
# Then It will ask password and upload the file
# Date : 04-April 2020
# AUTHOR :  Nandhakumar Madheshwaran
BASE=`pwd`
RAN=$RANDOM
WRAPPERFILE=/var/tmp/File_A.txt
REMOTE_SERVER_PASTE_PATH=/var/tmp/
HOSTLIST="/tmp/HOSTLIST_$RAN"
SFTP_D="/tmp/SFTP_DAT_$RAN"
#INPUT DECLARATIONS
echo -n "Provide Remote Server Username to perform wrapperscript copy : "
read USRNAME

#Getting Server Names
echo "Provide the server names one by one"
echo "Press CTRL+D after all the Hosts entered."
cat > $HOSTLIST
echo "File Saved"
sleep 1

echo "Below Servers are provided "
cat $HOSTLIST
#PREPARING SFTP BATCH FILE
echo "cd $REMOTE_SERVER_PASTE_PATH" > $SFTP_D
echo "put /var/tmp/File_A.sh" >> $SFTP_D
echo quit >> $SFTP_D


while read SVRIP; do
sftp -oBatchMode=no -b $SFTP_D -oStrictHostKeyChecking=no $USRNAME@$SVRIP > /dev/null
sleep 1
echo "File uploaded in $SVRIP"
done < $HOSTLIST
rm -f $SFTP_D
