#!/bin/sh
cd /home/$USER
rm -r -f startnode.sh
sudo apt update -y
# coreutils installed for chmod on minimal installed Ubuntu
sudo apt install coreutils -y
sudo apt install wget -y
wget --no-check-certificate --no-cache --no-cookies https://raw.githubusercontent.com/MachoDrone/UbDt2204modules/main/startnode.sh
chmod +x startnode.sh
echo " "
echo "------------------------------------------------------------"
echo "------------------------------------------------------------"
echo " "
echo startnode was installed or updated. Run with: ./startnode.sh
echo " "
echo "------------------------------------------------------------"
echo "------------------------------------------------------------"
