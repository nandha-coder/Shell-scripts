#!/bin/sh
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
}
MENU2()
{
echo "Performing Menu 2 tasks"
}
MENU3()
{
echo "Performing Menu 3 tasks"
}
SVR_SHUTDOWN()
{
echo "Shutting Down the server........"
#Shutdown related commands here
#
}
SVR_REBOOT()
{
echo "prforming Server Reboot"
#Reboot related commands here
#
}

#main menu starting from here
MAIN_MENU()
{
/usr/bin/clear
sleep 1
printf "\e$GREEN#######################################\n"
printf "\n"
printf "\e$MAGENTA  Welcome to Sample Menu Script\n"
printf "\n"
printf "\e$GREEN#######################################\n"
printf "\e$YELLOW	1.Menu No 1\n"	##working fine
printf "\e$YELLOW	2.Menu No 2\n"
printf "\e$YELLOW	3.Menu No 3\n"
printf "\e$YELLOW	S.Shutdown Server\n"	##working fine
printf "\e$YELLOW	R.Reboot Server\n"
printf "\n"
printf "\e$YELLOW	X.Exit\n"
printf "\e$NOCOLOR\n"
printf "\e$MAGENTA Enter the Option: "
read MENU_SELECTION
printf "\n$NOCOLOR Selected menu is $MENU_SELECTION\n"
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
