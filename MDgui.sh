#!/bin/bash

## wget -qO - 'https://raw.githubusercontent.com/MachoDrone/UbDt2204modules/main/MDgui.sh' | sudo -E bash
# wget -qO MDgui.sh 'https://raw.githubusercontent.com/MachoDrone/UbDt2204modules/main/MDgui.sh' && sudo bash MDgui.sh

sudo apt update -y
sudo apt install openssh-server -y

# Configure 4 tiled terminal windows#!/bin/bash

# Install necessary packages
sudo apt update
sudo apt install -y gnome-terminal wmctrl

# Create a script to launch and tile terminal windows
cat << 'EOF' > /home/$SUDO_USER/launch_terminals.sh
#!/bin/bash

# Launch the scripts in new terminal windows
gnome-terminal -- bash -c "/home/$SUDO_USER/glances.sh; exec bash" &
sleep 1
gnome-terminal -- bash -c "/home/$SUDO_USER/TPS-Report.sh.sh; exec bash" &
sleep 1
gnome-terminal -- bash -c "/home/$SUDO_USER/startnode.sh; exec bash" &
sleep 1
gnome-terminal -- bash -c "/home/$SUDO_USER/nvitop.sh; exec bash" &
sleep 1

# Wait a moment to ensure all terminals are launched
sleep 5

# Get the window IDs of the launched terminals
TERMINALS=($(wmctrl -l | grep 'gnome-terminal' | awk '{print $1}'))

# Tile the windows 2x2
SCREEN_WIDTH=$(xdpyinfo | awk '/dimensions:/ {print $2}' | awk -Fx '{print $1}')
SCREEN_HEIGHT=$(xdpyinfo | awk '/dimensions:/ {print $2}' | awk -Fx '{print $2}')
HALF_WIDTH=$((SCREEN_WIDTH / 2))
HALF_HEIGHT=$((SCREEN_HEIGHT / 2))

wmctrl -i -r ${TERMINALS[0]} -e 0,0,0,$HALF_WIDTH,$HALF_HEIGHT
wmctrl -i -r ${TERMINALS[1]} -e 0,$HALF_WIDTH,0,$HALF_WIDTH,$HALF_HEIGHT
wmctrl -i -r ${TERMINALS[2]} -e 0,0,$HALF_HEIGHT,$HALF_WIDTH,$HALF_HEIGHT
wmctrl -i -r ${TERMINALS[3]} -e 0,$HALF_WIDTH,$HALF_HEIGHT,$HALF_WIDTH,$HALF_HEIGHT
EOF

# Make the launch script executable
chmod +x /home/$SUDO_USER/launch_terminals.sh

# Add the launch script to the startup applications
mkdir -p /home/$SUDO_USER/.config/autostart
cat << 'EOF' > /home/$SUDO_USER/.config/autostart/launch_terminals.desktop
[Desktop Entry]
Type=Application
Exec=/home/$SUDO_USER/launch_terminals.sh
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name[en_US]=Launch Terminals
Name=Launch Terminals
Comment[en_US]=Launch 4 CLI scripts in tiled terminals
Comment=Launch 4 CLI scripts in tiled terminals
EOF

echo "Setup complete. The scripts will run in tiled terminal windows on GUI startup."

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
