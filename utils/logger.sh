#!/bin/bash
# Logger utilities by Abnazhor - 2020
#https://github.com/abnazhor/solus-scripts

#Declared colors to be used in the following lines.
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
RED='\033[0;31m'
LBLUE='\033[1;34m'
NC='\033[0m'

function info() {
    printf "${LBLUE}$1\n${NC}";
}

function error() {
    printf "${RED}$1\n${NC}";
}

function success() {
    printf "${GREEN}$1\n${NC}";
}