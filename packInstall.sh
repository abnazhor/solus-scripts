#!/bin/bash
#Installation script for Solus 4 - Version 1.0
#https://github.com/abnazhor/solus-scripts

#Declaring colors to be used.
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
RED='\033[0;31m'
LBLUE='\033[1;34m'
NC='\033[0m'

gamePack=(lutris steam)
mediaPack=(krita gimp)
devPack=(vscode gitkraken)

function installPack() {
    printf "${YELLOW}Installing media apps...\n";
    for app in $@;
    do
        printf "${LBLUE}Installing ${YELLOW} ${app^^} ${LBLUE}...\n";
        sudo eopkg install -y $app;
    done;
    printf "${GREEN}DONE!\n${NC}";
}

function installDevPack() {
    printf "${YELLOW}Installing Developer Pack...\n";
    installPack "${devPack[@]}";
}

function installGamePack() {
    printf "${YELLOW}Installing ${GREEN}Developer Pack${YELLOW}...\n";
    installPack "${gamePack[@]}";
}

function installMediaPack() {
    printf "${YELLOW} Installing ${GREEN}Media Pack${YELLOW}...\n";
    installPack "${mediaPack[@]}";
}

function fullInstallation() {
    printf "${LBLUE}Ready to make a ${YELLOW}FULL INSTALLATION${LBLUE}...\n";
    printf "${YELLOW}This will take some time...";
    
    installDevPack;
    installMediaPack;
    installGamePack;
}

function showPacks() {
    user_input="";
    printf "${LBLUE}The packs available right now are:\n";
    printf "${YELLOW}1.${LBLUE}Game Pack - Ready to play in seconds!\n";
    printf "${YELLOW}2.${LBLUE}Media Pack - Everything related to media!\n";
    printf "${YELLOW}3.${LBLUE}Developer Pack - Set up your dev environment in seconds!\n";
    printf "${GREEN}Would you like to choose one? If so, type its number. To go back, type 'no'${NC}\n";
    while [ "${user_input^^}" != "NO" ];
    do
        read user_input;
        case "$user_input" in
            1)
                installGamePack;
                break;
            ;;
            2)
                installMediaPack;
                break;
            ;;
            3)
                installDevPack;
                break;
            ;;
        esac;
    done;

    menu;
}

function menu() {
    user_input="";
    printf "${LBLUE}Hello! This is the base app installer script for ${GREEN}Solus 4${LBLUE}!\n";
    printf "${YELLOW}What can I do for you today?\n";
    printf "${YELLOW}1. ${GREEN}See what packs are available right now\n";
    printf "${YELLOW}2. ${GREEN}Install everything!\n"
    printf "${YELLOW}3. ${RED}Exit the installer\n${NC}";
    while [ "$user_input" != "3" ];
    do
        read user_input;
        case "$user_input" in
            1)
                showPacks;
            ;;
            2)
                fullInstallation;
            ;;
            3)
                echo "See you soon!";
            ;;
        esac;
        
    done;
}

menu;