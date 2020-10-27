#!/bin/bash
#Installation script for Minecraft - Abnazhor
#https://github.com/abnazhor/solus-scripts

#Imports custom logger functions to display information
source ../utils/logger.sh

cd ~/.builds || mkdir ~/.builds && cd ~/.builds;
info "Removing old Minecraft Launcher files if exists...";
rm -r minecraft-launcher;
mkdir minecraft-launcher;
cd minecraft-launcher;

info "Downloading Minecraft Launcher from source... (https://launcher.mojang.com/download/)";
wget --quiet https://launcher.mojang.com/download/Minecraft.tar.gz;
success "Done.";

info "Extracting...";
tar -xf Minecraft.tar.gz;
mv minecraft-launcher launcher;
mv launcher/* .;
success "Done.";

info "Removing unnecesary files...";
rmdir minecraft-launcher;
rm -r Minecraft.tar.gz;
success "Done.";

info "Adding a desktop shortcut...";
echo "[Desktop Entry]
Encoding=UTF-8
Version=1.0
Type=Application
Terminal=false
Exec=/home/$USER/.builds/minecraft-launcher/minecraft-launcher
Name=Minecraft Launcher" > ~/.local/share/applications/minecraft-launcher.desktop;

success "Minecraft Launcher has been successfully installed.";