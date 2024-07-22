#!/bin/ssh
cd /home/$USER
rm -r -f TPS-Report.sh
sudo apt update -y
sudo apt install coreutils -y
sudo apt install wget -y
wget --no-check-certificate --no-cache --no-cookies https://raw.githubusercontent.com/MachoDrone/UbDt2204modules/main/TPS-Report.sh
chmod +x TPS-Report.sh
echo TPS-Report was installed or updated
