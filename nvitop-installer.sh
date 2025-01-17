#!/bin/sh
cd /home/$USER
rm -r -f nvitop.sh
sudo apt update -y
sudo apt install python3-pip -y
sudo apt install git -y
# coreutils installed for chmod on minimal installed Ubuntu
sudo apt install coreutils -y
git clone --depth=1 https://github.com/XuehaiPan/nvitop.git
cd nvitop
pip3 install . --no-color
pip3 install -r requirements.txt --no-color
cd ..
wget --no-check-certificate --no-cache --no-cookies https://raw.githubusercontent.com/MachoDrone/UbDt2204modules/main/nvitop.sh
chmod +x nvitop.sh
echo " "
echo "------------------------------------------------------------"
echo "------------------------------------------------------------"
echo " "
echo nvitop was installed or updated. Run with: ./nvitop.sh
echo " "
echo "------------------------------------------------------------"
echo "------------------------------------------------------------"
