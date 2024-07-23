#!/bin/bash

# Define variables
AUTOSTART_DIR="$HOME/.config/autostart"
TILE_SCRIPT="$HOME/tile_terminals.sh"

# Function to create .desktop entry
create_desktop_entry() {
    local script_name=$1
    local script_path=$2

    local desktop_entry="$AUTOSTART_DIR/$script_name.desktop"

    echo "Creating $desktop_entry..."
    cat << EOF > "$desktop_entry"
[Desktop Entry]
Type=Application
Exec=gnome-terminal --title="$script_name" -- bash -c "$script_path; exec bash"
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name=$script_name
EOF
}

# Ensure the autostart directory exists
mkdir -p "$AUTOSTART_DIR"

# Create .desktop entries for the scripts
for script in glances.sh tpsview.sh startnode.sh nvitop.sh; do
    create_desktop_entry "$script" "$HOME/$script"
done

# Create the tiling script
echo "Creating tiling script $TILE_SCRIPT..."
cat << 'EOF' > "$TILE_SCRIPT"
#!/bin/bash

# Give time for the terminal windows to open
sleep 10

# Get the screen dimensions
SCREEN_WIDTH=$(xdpyinfo | awk '/dimensions:/ {print $2}' | awk -Fx '{print $1}')
SCREEN_HEIGHT=$(xdpyinfo | awk '/dimensions:/ {print $2}' | awk -Fx '{print $2}')

# Calculate window dimensions
WINDOW_WIDTH=$((SCREEN_WIDTH / 2))
WINDOW_HEIGHT=$((SCREEN_HEIGHT / 2))

# Get the window IDs of the terminal windows
TERMINAL_IDS=$(wmctrl -l | grep "$USER" | grep "Terminal" | awk '{print $1}')

# Tile the windows in a 2x2 grid
COUNTER=0
for ID in $TERMINAL_IDS; do
    if [ $COUNTER -eq 0 ]; then
        wmctrl -ir $ID -e 0,0,0,$WINDOW_WIDTH,$WINDOW_HEIGHT
    elif [ $COUNTER -eq 1 ]; then
        wmctrl -ir $ID -e 0,$WINDOW_WIDTH,0,$WINDOW_WIDTH,$WINDOW_HEIGHT
    elif [ $COUNTER -eq 2 ]; then
        wmctrl -ir $ID -e 0,0,$WINDOW_HEIGHT,$WINDOW_WIDTH,$WINDOW_HEIGHT
    elif [ $COUNTER -eq 3 ]; then
        wmctrl -ir $ID -e 0,$WINDOW_WIDTH,$WINDOW_HEIGHT,$WINDOW_WIDTH,$WINDOW_HEIGHT
    fi
    COUNTER=$((COUNTER + 1))
done
EOF
chmod +x "$TILE_SCRIPT"

# Create a .desktop entry for the tiling script
echo "Creating $AUTOSTART_DIR/tile_terminals.desktop..."
cat << EOF > "$AUTOSTART_DIR/tile_terminals.desktop"
[Desktop Entry]
Type=Application
Exec=$TILE_SCRIPT
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name=Tile Terminals
EOF

echo "Setup complete. The scripts will run and be tiled at startup."
