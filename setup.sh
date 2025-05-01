#!/bin/bash

run() {
    if "$@"; then
        echo "[$(tput setaf 10) SUCCESS $(tput sgr0)] $@"
    else
        echo "[$(tput setaf  9)  ERROR  $(tput sgr0)] $@"
    fi
}

echo "[$(tput setaf 12)dotfiles$(tput sgr0)] Started: Configuration"

run mkdir ~/Desktop
run mkdir ~/Downloads
run mkdir ~/Templates
run mkdir ~/Public
run mkdir ~/Documents
run mkdir ~/Documents/Projects
run mkdir ~/Music
run mkdir ~/Pictures
run mkdir ~/Pictures/Screenshots
run mkdir ~/Videos

run cp -r ./user/. ~/
run cp -r ./local/. ~/.local/
run cp -r ./config/. ~/.config/

run sudo cp -r ./etc/. /etc/
run sudo cp -r ./user/. /root/
run sudo systemctl enable bluetooth

run hyprctl reload

echo "[$(tput setaf 12)dotfiles$(tput sgr0)] Finished: Configuration"
