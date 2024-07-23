#!/bin/sh
cd /home/$SUDO_USER
rm -r -f glances.sh
sudo apt update -y
# coreutils installed for chmod on minimal installed Ubuntu
sudo apt install coreutils -y
# sudo apt install wget -y
# wget -O- https://bit.ly/glances | /bin/bash
sudo apt install glances -y
wget --no-check-certificate --no-cache --no-cookies https://raw.githubusercontent.com/MachoDrone/UbDt2204modules/main/glances.sh
chmod +x glances.sh
echo " "
echo "------------------------------------------------------------"
echo "------------------------------------------------------------"
echo " "
echo glances was installed or updated. Run with: ./glances.sh
echo " "
echo "------------------------------------------------------------"
echo "------------------------------------------------------------"
