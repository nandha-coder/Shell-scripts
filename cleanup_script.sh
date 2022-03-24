#!/bin/sh
## Purpose : Used to Find and delete specific files from the given list of directories.
## 
## The Directory list used in this scripts are /abc , /xyz  and /pqr
## Please feel free to modify the script as per your requirements.
## DATE: 
## Author: Nandhakumar Madheshwaran

#COLOR DEFENITION
NOCOLOR="\e[39m"
RED="\e[31m"
YELLOW="\e[33m"
GREEN="\e[32m"
BLUE="\e[34m"
MAGENTA="\e[35m"

#VARIABLE DECLARATION
BASE=`pwd`

#LIST OF DIRECTORIES TO BE CLEANED
# You can replace with the names ABC, XYZ and PQR with any other values as per your infra.

ABC="/abc"
XYZ="/xyz"
PQR="/pqr"


# Function Declarations

MENU1_ABC()
{
clear
printf "$BLUE Performing Menu 1 tasks $NOCOLOR\n\n"
sleep 1
printf "$GREEN Switching to the Directory \t${YELLOW}$ABC $NOCOLOR\n"
cd $ABC
sleep 1
printf "$GREEN Listing the files from the selected Directory $ABC $NOCOLOR\n\n"
ls -ltr

printf "\n$MAGENTA Proceed the File Cleanup activity on this directory Y:YES | B:Back to Main Menu | X:Exit the Program) : $NOCOLOR"
read CNFM
case $CNFM in
y|Y)    printf "$MAGENTA Enter the File Name: $NOCOLOR";
		read FILENAME;
		if [ -d $FILENAME ] ||  [ -f $FILENAME ]; then printf "\n$RED Delete the $FILENAME ? Y/N : $NOCOLOR";
		read FINALCONFIRMATION;
        if [[ $FINALCONFIRMATION = Y ]];
		then rm -rvf $FILENAME;
		else printf "\n\n$BLUE Cancelled..... Returning back$NOCOLOR\n\n"; sleep 3; MENU1_ABC; 
		fi 
		else printf "\n\n$BLUE Invalid File Name..... Returning back$NOCOLOR\n\n"; sleep 3; MENU1_ABC;
		fi
		;;
		
		
b|B)    sleep 2; MAIN_MENU ;;
x|X)    printf "$BLUE\n Exiting the Program.....THANK YOU \n\n$NOCOLOR"; break ;;
*)      printf "$BLUE\n Invalid Input..... $NOCOLOR"; sleep 2; MENU1_ABC ;;
esac
}


MENU2_XYZ()
{
echo "Performing Menu 2 tasks"
echo "This menu is not yet ready..Exiting the program"
exit
}
MENU3_PQR()
{
echo "Performing Menu 3 tasks"
echo "This menu is not yet ready.. Exiting the program"
exit
}



#main menu starting from here
MAIN_MENU()
{
/usr/bin/clear
#sleep 1
printf "$GREEN#######################################$NOCOLOR\n"
printf "\n"
printf "$MAGENTA  Welcome to Sample Menu Script$NOCOLOR\n"
printf "\n"
printf "$GREEN#######################################$NOCOLOR\n"
printf "$YELLOW	1.Clean /ABC $NOCOLOR\n"
printf "$YELLOW	2.Clean /XYZ $NOCOLOR\n"
printf "$YELLOW	3.Clean /PQR $NOCOLOR\n"
printf "\n"
printf "$YELLOW	X.Exit $NOCOLOR\n"
printf "$NOCOLOR\n"
printf "$MAGENTA Enter the Option: $NOCOLOR"
read MENU_SELECTION
printf "\n$NOCOLOR"
#sleep 2
case $MENU_SELECTION in
1) MENU1_ABC ;;
2) MENU2_XYZ ;;
3) MENU3_PQR ;;
x|X) printf "$BLUE\n Exiting the Program.....THANK YOU \n\n$NOCOLOR"; break ;;
*) printf "\n Invalid option try again \n";sleep 1;clear;MAIN_MENU;;
esac
}
MAIN_MENU
