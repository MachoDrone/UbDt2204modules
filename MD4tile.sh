wget -qO test.sh 'a sample github address/test.sh' && sudo bash test.sh && \
echo '[Desktop Entry]
Type=Application
Exec=gnome-terminal -- bash -c "bash /home/$SUDO_USER/glances.sh; exec bash"
Name=Glances
X-GNOME-Autostart-enabled=true
' | sudo tee /etc/xdg/autostart/glances.desktop && \
echo '[Desktop Entry]
Type=Application
Exec=gnome-terminal -- bash -c "bash /home/$SUDO_USER/TPS-Report.sh.sh; exec bash"
Name=TPS-Report
X-GNOME-Autostart-enabled=true
' | sudo tee /etc/xdg/autostart/tps-report.desktop && \
echo '[Desktop Entry]
Type=Application
Exec=gnome-terminal -- bash -c "bash /home/$SUDO_USER/startnode.sh; exec bash"
Name=StartNode
X-GNOME-Autostart-enabled=true
' | sudo tee /etc/xdg/autostart/startnode.desktop && \
echo '[Desktop Entry]
Type=Application
Exec=gnome-terminal -- bash -c "bash /home/$SUDO_USER/nvitop.sh; exec bash"
Name=NVITop
X-GNOME-Autostart-enabled=true
' | sudo tee /etc/xdg/autostart/nvitop.desktop && \
sudo apt-get update && sudo apt-get install -y wmctrl && \
echo '#!/bin/bash
sleep 10
wmctrl -r :ACTIVE: -t 0
gnome-terminal -- bash -c "bash /home/$SUDO_USER/glances.sh; exec bash"
sleep 1
wmctrl -r :ACTIVE: -e 0,0,0,-1,-1
gnome-terminal -- bash -c "bash /home/$SUDO_USER/TPS-Report.sh.sh; exec bash"
sleep 1
wmctrl -r :ACTIVE: -e 0,960,0,-1,-1
gnome-terminal -- bash -c "bash /home/$SUDO_USER/startnode.sh; exec bash"
sleep 1
wmctrl -r :ACTIVE: -e 0,0,540,-1,-1
gnome-terminal -- bash -c "bash /home/$SUDO_USER/nvitop.sh; exec bash"
sleep 1
wmctrl -r :ACTIVE: -e 0,960,540,-1,-1
' | sudo tee /home/$SUDO_USER/tile_terminals.sh && sudo chmod +x /home/$SUDO_USER/tile_terminals.sh && \
echo '[Desktop Entry]
Type=Application
Exec=/home/$SUDO_USER/tile_terminals.sh
Name=TileTerminals
X-GNOME-Autostart-enabled=true
' | sudo tee /etc/xdg/autostart/tile_terminals.desktop
