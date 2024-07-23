#!/bin/bash

## wget -qO - 'https://raw.githubusercontent.com/MachoDrone/UbDt2204modules/main/MDgui.sh' | sudo -E bash
# wget -qO MDgui.sh 'https://raw.githubusercontent.com/MachoDrone/UbDt2204modules/main/MDgui.sh' && sudo bash MDgui.sh

sudo apt update -y
sudo apt install openssh-server -y

# Configure 4 tiled terminal windows
wget -qO MDgui.sh 'https://raw.githubusercontent.com/MachoDrone/UbDt2204modules/main/MDgui.sh' && sudo bash MDgui.sh

mkdir -p ~/.config/autostart && \
echo '[Desktop Entry]
Type=Application
Exec=gnome-terminal -- bash -c "sleep 5; /home/$USER/glances.sh"
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name=Glances
Comment=Run Glances script' > ~/.config/autostart/glances.desktop && \
echo '[Desktop Entry]
Type=Application
Exec=gnome-terminal -- bash -c "sleep 5; /home/$USER/TPS-Report.sh"
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name=TPS-Report
Comment=Run TPS-Report script' > ~/.config/autostart/TPS-Report.desktop && \
echo '[Desktop Entry]
Type=Application
Exec=gnome-terminal -- bash -c "sleep 5; /home/$USER/startnode.sh"
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name=Start Node
Comment=Run Start Node script' > ~/.config/autostart/startnode.desktop && \
echo '[Desktop Entry]
Type=Application
Exec=gnome-terminal -- bash -c "sleep 5; /home/$USER/nvitop.sh"
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name=Nvitop
Comment=Run Nvitop script' > ~/.config/autostart/nvitop.desktop

# Add tiling script
echo '#!/bin/bash
echo "--------------------------------------------"
echo "10 second pause"
echo "--------------------------------------------"
sleep 10
wmctrl -lG | grep "gnome-terminal" | while read -r id; do wmctrl -i -r "$id" -e 0,0,0,960,540; done' > ~/tile_windows.sh
chmod +x ~/tile_windows.sh

mkdir -p ~/.config/autostart && \
echo '[Desktop Entry]
Type=Application
Exec=/home/$USER/tile_windows.sh
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name=Tile Windows
Comment=Tile terminal windows 2x2' > ~/.config/autostart/tile_windows.desktop


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
