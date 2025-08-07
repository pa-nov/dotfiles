#!/bin/bash

title=$'\e[94mdotfiles\e[0m'

install_packages() {
    sudo pacman -S --noconfirm --needed $@
    sudo pacman -D --noconfirm --quiet --asexplicit $@
}

echo "[${title}] Started: Installation"

sudo cp ./etc/pacman.conf /etc/pacman.conf
sudo pacman -Syu --noconfirm

install_packages openssh curl wget socat man-db nano htop dmidecode git
install_packages bash-completion man-pages brightnessctl zip unzip
install_packages libcanberra imagemagick ffmpeg gst-libav gst-plugins-base
install_packages gst-plugins-ugly gst-plugins-bad gst-plugins-good

install_packages orchis-theme tela-circle-icon-theme-standard
install_packages noto-fonts-emoji otf-font-awesome
install_packages ttf-roboto ttf-jetbrains-mono

install_packages tk gtk3 gtk4 qt5-wayland qt6-wayland hyprland
install_packages xdg-utils xdg-desktop-portal-hyprland grim slurp
install_packages hyprlock hyprpaper hyprpicker hyprpolkitagent
install_packages waybar wofi wtype dunst gvfs gnome-keyring cliphist
install_packages networkmanager network-manager-applet blueman

install_packages kitty thunar thunar-archive-plugin xarchiver
install_packages mousepad ristretto parole gparted
install_packages qemu-desktop gimp steam

echo "[${title}] Finished: Installation"

while true; do
    read -r -p "[${title}] Run configuration script now? [y/n] " result
    if [[ "$result" == [Yy]* ]]; then
        ./setup.sh
        break
    elif [[ "$result" == [Nn]* ]]; then
        read -r -s -n 1 -p "[${title}] Press any key to continue..." && echo
        break
    fi
done
