 #!/bin/bash
user=$(whoami)
GREEN_FG=`tput setaf 2`
YELLOW_BG=`tput setab 3`
RESET=`tput sgr0`

echo "
 _____  _                 _         _              
|  __ \(_)               (_)       | |             
| |__) |_    _ __   _ __  _  _ __  | |_  ___  _ __ 
|  ___/| |  | '_ \ | '__|| || '_ \ | __|/ _ \| '__|
| |    | |  | |_) || |   | || | | || |_|  __/| |   
|_|    |_|  | .__/ |_|   |_||_| |_| \__|\___||_|   
            | |                                    
            |_|                                    
"
echo -e "\n"

echo ${GREEN_FG}${YELLOW_BG} "FIRST PHASE!" ${RESET}  | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta" | tr -d '\n' | head -c $(tput cols)
echo -e "\n"
echo ${GREEN_FG}${YELLOW_BG} "UPDATE!" ${RESET}  | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta" | tr -d '\n' | head -c $(tput cols)
	echo -e "\n"
sudo apt-get update -y && sudo apt-get upgrade -y
echo ${GREEN_FG}${YELLOW_BG} " PHASE DONE!" ${RESET}  | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta" | tr -d '\n' | head -c $(tput cols)
	echo -e "\n"
read -p "Press ENTER to continue...."	#You need to press ENTER
clear

echo ${GREEN_FG}${YELLOW_BG} "SECOND PHASE!" ${RESET}  | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta" | tr -d '\n' | head -c $(tput cols)
	echo -e "\n"
echo ${GREEN_FG}${YELLOW_BG} "CUPS INSTALLATION!" ${RESET}  | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta" | tr -d '\n' | head -c $(tput cols)
	echo -e "\n"
sudo apt-get install cups -y #--> printer server
echo ${GREEN_FG}${YELLOW_BG} "PHASE DONE!" ${RESET}  | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta" | tr -d '\n' | head -c $(tput cols)
echo -e "\n"
read -p "Press ENTER to continue...."
clear

echo ${GREEN_FG}${YELLOW_BG} "THIRD PHASE!" ${RESET}  | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta" | tr -d '\n' | head -c $(tput cols)
	echo -e "\n"
echo "Hello" ${user} "! You will be added to the group of users which can use printers!"
sudo usermod -aG lpadmin ${user}
sudo cupsctl --remote-any
echo ${GREEN_FG}${YELLOW_BG} " PHASE DONE!" ${RESET}  | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta" | tr -d '\n' | head -c $(tput cols)
	echo -e "\n"
read -p "Press ENTER to continue...."
clear


echo ${GREEN_FG}${YELLOW_BG} "FOURTH PHASE!" ${RESET}  | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta" | tr -d '\n' | head -c $(tput cols)
	echo -e "\n"
echo "PLEASE READ CAREFUL, BEFORE PROCEED!"
	echo -e "\n"
echo "If you are using WLAN please copy this to your clipboard"
echo '
interface wlan0
static ip_address='${GREEN_FG}${YELLOW_BG} "YOUR STATIC IP ADDRESS / CIDR" ${RESET}
printf 'static routers=192.168.0.1%s\nstatic domain_name_servers=192.168.0.1'
	echo -e "\n"

echo "If you are using LAN please copy this to your clipboard"
echo '
interface eth0
static ip_address='${GREEN_FG}${YELLOW_BG} "YOUR STATIC IP ADDRESS / CIDR" ${RESET}
printf 'static routers=192.168.0.1%s\nstatic domain_name_servers=192.168.0.1'
	echo -e "\n"
echo 'You need to add this lines to the end off the file!'
echo 'And please replace the colored line with your chosen IP address!'
read -p "Press ENTER to continue...."

sudo nano /etc/dhcpcd.conf
clear

echo ${GREEN_FG}${YELLOW_BG} "FIFTH PHASE!" ${RESET}  | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta" | tr -d '\n' | head -c $(tput cols)
	echo -e "\n"
while true; do
    read -p "You need to reboot your computer? Would you like to do it NOW " yn
    case $yn in
        [Yy]* ) echo "Farewell!" ${user} ; sudo reboot;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
