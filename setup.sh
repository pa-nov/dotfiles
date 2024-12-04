#!/bin/bash

mkdir ~/Desktop
mkdir ~/Downloads
mkdir ~/Templates
mkdir ~/Public
mkdir ~/Documents
mkdir ~/Documents/Projects
mkdir ~/Music
mkdir ~/Pictures
mkdir ~/Pictures/Screenshots
mkdir ~/Videos

sudo cp -r ./sddm/. /etc/
sudo cp -r ./root/. /root/
cp -r ./home/. ~/
cp -r ./applications/. ~/.local/share/applications/
cp -r ./config/. ~/.config/

sudo systemctl enable bluetooth
