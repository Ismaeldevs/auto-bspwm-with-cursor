#!/bin/bash

# Script to fix cursor visibility issues in bspwm environment
# Author: Assistant fixing r1vs3c's auto-bspwm

# Colors
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"

echo -e "${blueColour}[*] Fixing cursor visibility issues...\n${endColour}"

# Install cursor themes if not present
echo -e "${purpleColour}[*] Ensuring cursor themes are installed...\n${endColour}"
sudo apt install -y adwaita-icon-theme xcursor-themes x11-xserver-utils xserver-xorg-input-all

# Set cursor theme in environment variables
echo -e "${purpleColour}[*] Setting cursor environment variables...\n${endColour}"
export XCURSOR_THEME=Adwaita
export XCURSOR_SIZE=16

# Load X resources
echo -e "${purpleColour}[*] Loading X resources...\n${endColour}"
xrdb -merge ~/.Xresources

# Set root window cursor
echo -e "${purpleColour}[*] Setting root window cursor...\n${endColour}"
xsetroot -cursor_name left_ptr

# Update cursor theme for the current session
echo -e "${purpleColour}[*] Updating cursor theme for current session...\n${endColour}"
gsettings set org.gnome.desktop.interface cursor-theme 'Adwaita' 2>/dev/null || true

# Restart picom to apply changes
echo -e "${purpleColour}[*] Restarting picom...\n${endColour}"
pkill picom
sleep 1
picom --config ~/.config/picom/picom.conf &

echo -e "${greenColour}[+] Cursor visibility fix completed!\n${endColour}"
echo -e "${yellowColour}[?] If the cursor is still not visible, try logging out and logging back in.\n${endColour}"