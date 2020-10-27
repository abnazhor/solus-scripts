#!/bin/bash
#Installation script for Typora - Abnazhor
#https://github.com/abnazhor/solus-scripts

#Imports custom logger functions to display information
source ../utils/logger.sh

cd ~/.builds || mkdir ~/.builds && cd ~/.builds;
info "Removing old Typora files if exists...";
rm -r typora;
mkdir typora;
cd typora;

info "Downloading Typora from source... (https://typora.io/)";
wget --quiet https://typora.io/linux/Typora-linux-x64.tar.gz;
success "Done.";

info "Extracting...";
tar -xf Typora-linux-x64.tar.gz;
mv bin/Typora-linux-x64/* .
success "Done".

info "Removing unnecesary files...";
rm -r bin
rm -r Typora-linux-x64.tar.gz;
success "Done.";

info "Adding a desktop shortcut...";
echo "[Desktop Entry]
Encoding=UTF-8
Version=1.0
Type=Application
Terminal=false
Exec=/home/$USER/.builds/typora/Typora
Name=Typora" > ~/.local/share/applications/typora.desktop

success "Typora has been successfully installed.";