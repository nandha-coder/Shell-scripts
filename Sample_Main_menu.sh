#!/bin/sh
## This script is used to create a menu based interaction in Shell script
## Sample menu is created here
## You can update the menu name accordingly
##
## DATE: 4th April 2020
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

# Function Declarations
MENU1()
{
echo "Performing Menu 1 tasks"
#$BASE/Menu_1.sh
}
MENU2()
{
echo "Performing Menu 2 tasks"
#$BASE/Menu_2.sh
}
MENU3()
{
echo "Performing Menu 3 tasks"
#$BASE/Menu_3.sh
}
SVR_SHUTDOWN()
{
sleep 2
printf "\n Enter the Reference Ticket : "
read REFTICKT
printf "\n Do you Want to Proceed to Shutdown the server Y/N : "
read CNFM
case $CNFM in
y|Y) echo "Initiating the Shutdown..." && wall -n "Server Going to to halt now under Reference Ticket $REFTICKT " && shutdown -h now ;;
n|N) printf "\r Returning back to main menu"; sleep 3; MAIN_MENU ;;
*) printf "\rInvalid Input"; sleep 2; MAIN_MENU ;;
esac

}
SVR_REBOOT()
{
sleep 2
printf "\n Do you Want to Proceed to reboot the server Y/N : "
read CNFM
case $CNFM in
y|Y) shutdown -r now ;;
n|N) printf "\r Returning back to main menu"; sleep 3; MAIN_MENU ;;
*) printf "\rInvalid Input"; sleep 2; MAIN_MENU ;;
esac
}

#main menu starting from here
MAIN_MENU()
{
/usr/bin/clear
sleep 1
printf "$GREEN#######################################\n"
printf "\n"
printf "$MAGENTA  Welcome to Sample Menu Script\n"
printf "\n"
printf "$GREEN#######################################\n"
printf "$YELLOW	1.Menu No 1\n"	##working fine
printf "$YELLOW	2.Menu No 2\n"
printf "$YELLOW	3.Menu No 3\n"
printf "$YELLOW	S.Shutdown Server\n"	##working fine
printf "$YELLOW	R.Reboot Server\n"
printf "\n"
printf "$YELLOW	X.Exit\n"
printf "$NOCOLOR\n"
printf "$MAGENTA Enter the Option: "
read MENU_SELECTION
printf "\n$NOCOLOR"
sleep 2
case $MENU_SELECTION in
1) MENU1 ;;
2) MENU2 ;;
3) MENU3 ;;
S|s) SVR_SHUTDOWN ;;
R|r) SVR_REBOOT ;;
x|X) printf "\n Thank you\n\n";break;;
*) printf "\n Invalid option try again \n";sleep 2;clear;MAIN_MENU;;
esac
}
MAIN_MENU
