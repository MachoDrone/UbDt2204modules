#!/bin/bash

# Install necessary packages
sudo apt update
sudo apt install -y gnome-terminal wmctrl

# Create a script to launch and tile terminal windows
cat << 'EOF' > /home/$USER/launch_terminals.sh
#!/bin/bash

# Launch the scripts in new terminal windows
gnome-terminal -- bash -c "/home/$USER/glances.sh; exec bash" &
sleep 1
gnome-terminal -- bash -c "/home/$USER/TPS-Report.sh.sh; exec bash" &
sleep 1
gnome-terminal -- bash -c "/home/$USER/startnode.sh; exec bash" &
sleep 1
gnome-terminal -- bash -c "/home/$USER/nvitop.sh; exec bash" &
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
chmod +x /home/$USER/launch_terminals.sh

# Add the launch script to the startup applications
mkdir -p /home/$USER/.config/autostart
cat << 'EOF' > /home/$USER/.config/autostart/launch_terminals.desktop
[Desktop Entry]
Type=Application
Exec=/home/$USER/launch_terminals.sh
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name[en_US]=Launch Terminals
Name=Launch Terminals
Comment[en_US]=Launch 4 CLI scripts in tiled terminals
Comment=Launch 4 CLI scripts in tiled terminals
EOF

echo "Setup complete. The scripts will run in tiled terminal windows on GUI startup."
