#!/bin/bash

# Install wmctrl if not already installed
if ! command -v wmctrl &> /dev/null; then
    echo "wmctrl not found. Installing..."
    sudo apt update && sudo apt install -y wmctrl
fi

# Run the scripts in new terminal windows
gnome-terminal -- bash -c "/home/$USER/glances.sh; exec bash" &
gnome-terminal -- bash -c "/home/$USER/TPS-Report.sh.sh; exec bash" &
gnome-terminal -- bash -c "/home/$USER/startnode.sh; exec bash" &
gnome-terminal -- bash -c "/home/$USER/nvitop.sh; exec bash" &

# Wait for terminals to open
sleep 5

# Tile windows (this is a placeholder, adjust as needed)
wmctrl -r :ACTIVE: -e 0,0,0,960,540
wmctrl -r :ACTIVE: -e 0,960,0,960,540
wmctrl -r :ACTIVE: -e 0,0,540,960,540
wmctrl -r :ACTIVE: -e 0,960,540,960,540

# Add to startup applications
mkdir -p ~/.config/autostart
cat <<EOF > ~/.config/autostart/MD4tile.desktop
[Desktop Entry]
Type=Application
Exec=/usr/local/bin/MD4tile.sh
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name=MD4tile
Comment=Run terminal scripts and tile windows
EOF
