#!/bin/bash
# wget -qO MDtilewin.sh 'https://raw.githubusercontent.com/MachoDrone/UbDt2204modules/main/MDtilewin.sh' && sudo bash MDtilewin.sh
# Prompt for username
read -p "Enter your username: " username

# Check if username is empty
if [ -z "$username" ]; then
  echo "Username cannot be empty."
  exit 1
fi

# Define the paths to the scripts
glances_script="/home/$username/glances.sh"
tps_report_script="/home/$username/TPS-Report.sh"
startnode_script="/home/$username/startnode.sh"
nvitop_script="/home/$username/nvitop.sh"

# Install wmctrl
sudo apt update
sudo apt install -y wmctrl

# Create a script to open terminals and run the scripts
startup_script="/home/$username/startup-scripts.sh"

cat <<EOL > $startup_script
#!/bin/bash

# Open terminals and run scripts
gnome-terminal -- bash -c "$glances_script; exec bash" &
gnome-terminal -- bash -c "$tps_report_script; exec bash" &
gnome-terminal -- bash -c "$startnode_script; exec bash" &
gnome-terminal -- bash -c "$nvitop_script; exec bash" &

# Wait for terminals to open
sleep 5

# Tile the terminals
wmctrl -r :ACTIVE: -e 0,0,0,960,540
wmctrl -r :ACTIVE: -e 0,960,0,960,540
wmctrl -r :ACTIVE: -e 0,0,540,960,540
wmctrl -r :ACTIVE: -e 0,960,540,960,540
EOL

# Make the startup script executable
chmod +x $startup_script

# Create the autostart directory if it doesn't exist
autostart_dir="/home/$username/.config/autostart"
if [ ! -d "$autostart_dir" ]; then
  mkdir -p $autostart_dir
fi

# Create a .desktop entry for the startup script
desktop_entry="$autostart_dir/startup-scripts.desktop"

cat <<EOL > $desktop_entry
[Desktop Entry]
Type=Application
Exec=$startup_script
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name=Startup Scripts
Comment=Runs custom startup scripts
EOL

# Set the correct permissions for the .desktop file
chmod 644 $desktop_entry

echo "Setup complete. The scripts will run in separate terminals on startup and be tiled 2x2."
