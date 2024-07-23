#!/bin/bash

## wget -qO - 'https://raw.githubusercontent.com/MachoDrone/UbDt2204modules/main/MDgui.sh' | sudo -E bash
# wget -qO MDgui.sh 'https://raw.githubusercontent.com/MachoDrone/UbDt2204modules/main/MDgui.sh' && sudo bash MDgui.sh

sudo apt update -y
sudo apt install openssh-server -y

# Configure 4 tiled terminal windows
sudo rm -f MDtilewin.sh
wget https://raw.githubusercontent.com/MachoDrone/UbDt2204modules/main/MDtilewin.sh
chmod +x MDtilewin.sh
./MDtilewin.sh
sudo rm -f MDtilewin.sh
# wget -qO - https://raw.githubusercontent.com/MachoDrone/UbDt2204modules/main/MDtilewin.sh | sudo -E bash
# wget -qO MDtilewin.sh 'https://raw.githubusercontent.com/MachoDrone/UbDt2204modules/main/MDtilewin.sh' && sudo bash MDtilewin.sh
# wget -qO - https://raw.githubusercontent.com/MachoDrone/UbDt2204modules/main/MDtilewin.sh| sudo bash

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

# Install Nosana Node
wget -qO nosnodeinstaller1.sh 'https://raw.githubusercontent.com/MachoDrone/nosnodeinstaller/main/nosnodeinstaller1.sh' && sudo bash nosnodeinstaller1.sh
