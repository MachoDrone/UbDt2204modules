#!/bin/sh
cd /home/$SUDO_USER
rm -r -f TPS-Report.sh
sudo apt update -y
# coreutils installed for chmod on minimal installed Ubuntu
sudo apt install coreutils -y
sudo apt install wget -y
wget --no-check-certificate --no-cache --no-cookies https://raw.githubusercontent.com/MachoDrone/UbDt2204modules/main/TPS-Report.sh
chmod +x TPS-Report.sh
echo " "
echo "------------------------------------------------------------"
echo "------------------------------------------------------------"
echo " "
echo TPS-Report was installed or updated. Run with: ./TPS-Report.sh
echo " "
echo "------------------------------------------------------------"
echo "------------------------------------------------------------"
