#!/bin/bash
clear

sl | lolcat
menu(){
	echo 
	echo "Is this the MENU?" | cowsay -n | cowsay -n | cowsay -n | lolcat
	Green='\033[0;32m'
	NC='\033[0m'
	echo -e "${Green}^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^${NC}"
	echo -e "${Green}^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^${NC}"
	figlet -f slant MENU | lolcat -a
	echo -e "${Green}^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^${NC}"
	echo -e "${Green}^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^${NC}"
	echo "1. Launch htop to see processor acitvities"
	echo "2. Users currently logged in"
	echo "3. Show CPU info"
	echo "4. Show filesystem"
	echo "5. Show graphics processor"
	echo "6. Open Network manager"
	echo "7. Show pci devices in tree format"
	echo "8. Show space available on hard disk"
	echo "9. Exit"
	echo
	echo "----------------------------"
	echo
	echo "Please enter option [1 - 9]:"  
}

option=y

while [ "$option" != "10" ]
do
	menu

	read option

	case $option in
		1) htop;; # the user has to press [q] to exit and get back to main menu 
		2) who;;
		3) cat /proc/cpuinfo | grep -Em 4 "model name|cpu MHz|cpu cores|vendor_id";;
		4) lsblk;;
		5) lspci -v | grep -i vga;;
		6) nmtui;;
		7) lspci -vt;;
		8) df -i;;
		9) break;; # exit menu
		*) echo "Wrong option";; # * means anything else
esac

read -p "Press [enter] key to continue..." 
clear

done

clear
