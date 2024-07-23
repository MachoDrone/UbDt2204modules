#!/bin/sh
cd /home/$SUDO_USER
rm -r -f nvtop.sh
sudo apt update -y
# coreutils installed for chmod on minimal installed Ubuntu
sudo apt install coreutils -y
sudo apt install nvtop -y
wget --no-check-certificate --no-cache --no-cookies https://raw.githubusercontent.com/MachoDrone/UbDt2204modules/main/nvtop.sh
chmod +x nvtop.sh
echo .
echo ***************************************************
echo nvtop was installed or updated. Run with: ./nvtop.sh
echo ***************************************************
