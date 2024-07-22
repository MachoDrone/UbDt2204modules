#!/bin/sh
cd /home/$USER
rm -r -f glances.sh
sudo apt update -y
# coreutils installed for chmod on minimal installed Ubuntu
sudo apt install coreutils -y
sudo apt install wget -y
wget -O- https://bit.ly/glances | /bin/bash
wget --no-check-certificate --no-cache --no-cookies https://raw.githubusercontent.com/MachoDrone/UbDt2204modules/main/glances.sh
chmod +x glances.sh
echo glances was installed or updated. Run with: ./glances.sh
