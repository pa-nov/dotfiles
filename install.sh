#!/bin/bash

title=$(echo -e "\e[94mdotfiles\e[0m")

install_packages() {
    sudo pacman -S --needed --noconfirm $@
    sudo pacman -D --quiet --asexplicit --noconfirm $@
}

echo "[$title] Started: Installation"

sudo cp ./etc/pacman.conf /etc/pacman.conf
sudo pacman -Syu --noconfirm

install_packages openssh curl wget socat nano htop git
install_packages bash-completion brightnessctl zip unzip
install_packages orchis-theme tela-circle-icon-theme-standard
install_packages noto-fonts-emoji otf-font-awesome ttf-roboto ttf-jetbrains-mono

install_packages tk gtk3 gtk4 qt5-wayland qt6-wayland hyprland
install_packages xdg-utils xdg-desktop-portal-hyprland grim slurp
install_packages hyprlock hyprpaper hyprpicker hyprpolkitagent
install_packages waybar wofi wtype dunst gvfs gnome-keyring cliphist
install_packages networkmanager network-manager-applet blueman

install_packages kitty libcanberra
install_packages thunar thunar-archive-plugin xarchiver
install_packages mousepad ristretto vlc gparted

# sudo pacman -S code
# sudo pacman -S qemu-desktop
# sudo pacman -S steam gamescope

echo "[$title] Finished: Installation"

while true; do
    read -r -p "[$title] Run configuration script now? [y/n] " result
    if [[ "$result" == [Yy]* ]]; then
        ./setup.sh
        break
    elif [[ "$result" == [Nn]* ]]; then
        read -r -s -n 1 -p "[$title] Press any key to continue..." && echo
        break
    fi
done
