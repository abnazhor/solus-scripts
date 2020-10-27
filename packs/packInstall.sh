#!/bin/bash
#Installation script for Solus 4 - Version 1.0
#https://github.com/abnazhor/solus-scripts

#Declared colours to be used in the following lines.
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
RED='\033[0;31m'
LBLUE='\033[1;34m'
NC='\033[0m'

gamePack=(lutris steam xboxdrv)
mediaPack=(krita gimp vlc lollypop peek)
devPack=(vscode gitkraken)
socialPack=(telegram)


#Generic function to install any array of apps
function installPack() {
    printf "${YELLOW}Installing media apps...\n";
    for app in $@;
    do
        printf "${LBLUE}Installing ${YELLOW} ${app^^} ${LBLUE}...\n";
        sudo eopkg install -y $app;
    done;
    printf "${GREEN}DONE!\n${NC}";
}

#Specific functions for every pack, as they can contain programs that are not in the repositories in the future.
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

function installSocialPack() {
    printf "${YELLOW} Installing ${GREEN}Social Pack${YELLOW}...\n";
    installPack "${socialPack[@]}";
}

#Makes a full installation with all the available packs.
function fullInstallation() {
    printf "${LBLUE}Ready to make a ${YELLOW}FULL INSTALLATION${LBLUE}...\n";
    printf "${YELLOW}This will take some time...";
    
    installDevPack;
    installMediaPack;
    installGamePack;
}

#Shows packs in a menu and make them selectable.
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

#Installs developer packages. 
function installSysDevel() {
    printf "${YELLOW}Installing System Developer Pack...${NC}\n";
    sudo eopkg install -c system.devel;
    clear;
    printf "${GREEN}DONE!\n${NC}";
}

#Shows up menu text every time it is needed, not once.
function menuTexts() {
    printf "${LBLUE}Hello! This is the base app installer script for ${GREEN}Solus 4${LBLUE}!\n";
    printf "${YELLOW}What can I do for you today?\n";
    printf "${YELLOW}1. ${GREEN}See what packs are available right now\n";
    printf "${YELLOW}2. ${GREEN}Install everything!\n";
    printf "${YELLOW}3. ${GREEN}Install System Developer Pack\n";
    printf "${YELLOW}4. ${RED}Exit the installer\n${NC}";
}

#Loads menu and waits for response to do any action.
function menu() {
    user_input="";
    while [ "$user_input" != "4" ];
    do
        menuTexts;
        read user_input;
        case "$user_input" in
            1)
                showPacks;
            ;;
            2)
                fullInstallation;
            ;;
            3)
                installSysDevel;
            ;;
            4)
                echo "See you soon!";
            ;;
        esac;
        
    done;
}

#Start of the script.
menu;