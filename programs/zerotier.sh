#!/bin/bash
#Installation script for ZeroTierOne - Abnazhor
#https://github.com/zerotier/ZeroTierOne
#https://github.com/abnazhor/solus-scripts

#Imports custom logger functions to display information
source ../utils/logger.sh

cd ~/.builds || mkdir ~/.builds && cd ~/.builds;
info "Removing old ZeroTierOne files if exists...";
rm -r zerotier;

info "Downloading ZeroTierOne from source... (https://github.com/zerotier/ZeroTierOne)";
git clone https://github.com/zerotier/ZeroTierOne zerotier > /dev/null;
success "Done.";

cd zerotier;
info "Compiling...";
make;
make selftest;
success "Done.";

user_input="";
while [ "$user_input" != "N" ] && [ "$user_input" != "Y" ];
do
    info "Compiling has been successfull. Would you like to install it? Y/N";
    read user_input;
    if [ "$user_input" == "Y" ]
    then
        info "Installing...";
        sudo make install;
        
        info "Adding ZeroTierOne service from file... (https://raw.githubusercontent.com/zerotier/ZeroTierOne/master/debian/zerotier-one.service)";
        sudo wget https://raw.githubusercontent.com/zerotier/ZeroTierOne/master/debian/zerotier-one.service -O /etc/systemd/system/zerotier.service;

        success "ZeroTierOne has been successfully installed.";
    fi
done;