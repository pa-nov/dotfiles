#!/bin/bash

echo "[$(tput setaf 12)dotfiles$(tput sgr0)] Started: Installation"

sudo pacman -Syu --noconfirm

sudo pacman -S --noconfirm --needed hyprland xdg-desktop-portal-hyprland hyprpolkitagent
sudo pacman -S --noconfirm --needed qt5-wayland qt6-wayland gnome-keyring gvfs cliphist
sudo pacman -S --noconfirm --needed networkmanager network-manager-applet blueman brightnessctl
sudo pacman -S --noconfirm --needed hyprlock hyprpaper hyprpicker waybar wofi dunst grim slurp

sudo pacman -S --noconfirm --needed git tk zip unzip nwg-look qt5ct qt6ct
sudo pacman -S --noconfirm --needed kitty thunar thunar-archive-plugin xarchiver
sudo pacman -S --noconfirm --needed mousepad ristretto vlc gparted

sudo pacman -S --noconfirm --needed noto-fonts-emoji otf-font-awesome ttf-roboto ttf-jetbrains-mono
sudo pacman -S --noconfirm --needed orchis-theme tela-circle-icon-theme-standard

echo "[$(tput setaf 12)dotfiles$(tput sgr0)] Finished: Installation"

./setup.sh
