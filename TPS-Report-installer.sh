#!/bin/ssh
cd /home/$USER
rm -r -f TPS-Report.sh
wget https://raw.githubusercontent.com/MachoDrone/UbDt2204modules/main/TPS-Report.sh
chmod +x TPS-Report.sh
echo TPS-Report was installed or updated
