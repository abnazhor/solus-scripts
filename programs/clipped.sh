#!/bin/bash
#Installation script for Clipped - Abnazhor
#https://github.com/abnazhor/solus-scripts

#Imports custom logger functions to display information
source ../utils/logger.sh

cd ~/.builds || mkdir ~/.builds && cd ~/.builds;
info "Removing old Clipped files if exists...";
rm -r clipped;

info "Downloading Clipped from source... (https://github.com/davidmhewitt/clipped.git)";
git clone https://github.com/davidmhewitt/clipped.git clipped > /dev/null;
success "Done.";

cd clipped;
info "Building...";
meson build --prefix=/usr;
cd build;
ninja;
success "Done.";

user_input="";
while [ "$user_input" != "N" ] && [ "$user_input" != "Y" ];
do
    info "Building has been successful. Would you like to install it? Y/N";
    read user_input;
    if [ "$user_input" == "Y" ]
    then
        info "Installing...";
        sudo ninja install;
        success "Clipped has been successfully installed.";
    fi
done;
