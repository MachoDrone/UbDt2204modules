#!/bin/bash

## wget -qO - 'https://raw.githubusercontent.com/MachoDrone/UbDt2204modules/main/MDgui.sh' | sudo -E bash
# wget -qO MDgui.sh 'https://raw.githubusercontent.com/MachoDrone/UbDt2204modules/main/MDgui.sh' && sudo bash MDgui.sh

sudo apt update -y
sudo apt install openssh-server -y

# Configure 4 tiled terminal windows#!/bin/bash

# Install necessary packages
sudo apt update

# Create a script to launch and tile terminal windows


echo "************************************************************************************************************************"
echo "************************************************************************************************************************"
echo "************************************************************************************************************************"
echo "************************************************************************************************************************"

# Install nvitop (this is not nvtop)
wget -qO - https://raw.githubusercontent.com/MachoDrone/UbDt2204modules/main/nvitop-installer.sh| sudo bash

# Install nvtop (this is not nvitop)
wget -qO - https://raw.githubusercontent.com/MachoDrone/UbDt2204modules/main/nvtop-installer.sh| sudo bash

# Install glances
wget -qO - https://raw.githubusercontent.com/MachoDrone/UbDt2204modules/main/glances-installer.sh| sudo bash

# Create startscript for node
wget -qO - https://raw.githubusercontent.com/MachoDrone/UbDt2204modules/main/startnode-installer.sh| sudo bash

# Install Tokens per second monitor
wget -qO - https://raw.githubusercontent.com/MachoDrone/UbDt2204modules/main/TPS-Report-installer.sh| sudo bash

echo "************************************************************************************************************************"
echo "************************************************************************************************************************"

# Install Nosana Node
wget -qO nosnodeinstaller1.sh 'https://raw.githubusercontent.com/MachoDrone/nosnodeinstaller/main/nosnodeinstaller1.sh' && sudo bash nosnodeinstaller1.sh
