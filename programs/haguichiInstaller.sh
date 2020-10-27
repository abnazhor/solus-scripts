#!/bin/bash
#Installation script for Haguichi - Abnazhor
#https://github.com/abnazhor/solus-scripts

#Declared colors to be used in the following lines.
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
RED='\033[0;31m'
LBLUE='\033[1;34m'
NC='\033[0m'

function installSysDevel() {
    printf "${YELLOW}Installing System Developer Pack...${NC}\n";
    sudo eopkg install -c system.devel;
    clear;
    printf "${GREEN}DONE!\n${NC}";
}

function main() {
    user_input="";
    printf "${YELLOW}[WARNING] This installation assumes you have installed Solus System.devel package.\n";
    printf "Would you like to check its installation? ${NC}[${GREEN}Y${NC}/${RED}N${NC}]\n";
    read user_input;
    if ["$user_input" == "Y"];
    then
            installSysDevel;
    fi;
    sudo eopkg install -c system.devel;
}

main;