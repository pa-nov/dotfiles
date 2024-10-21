#!/bin/bash

sudo pacman -S noto-fonts-emoji otf-font-awesome ttf-roboto ttf-jetbrains-mono --noconfirm --needed
sudo pacman -S polkit-kde-agent dunst grim slurp wofi --noconfirm --needed
sudo pacman -S gvfs cliphist blueman qt5ct qt6ct nwg-look --noconfirm --needed

sudo pacman -S hyprpaper hyprpicker hyprlock waybar --noconfirm --needed
sudo pacman -S zip unzip xarchiver --noconfirm --needed
sudo pacman -S thunar thunar-archive-plugin --noconfirm --needed
sudo pacman -S mousepad ristretto vlc gparted --noconfirm --needed

echo ""
./configure.sh
