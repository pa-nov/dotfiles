#!/bin/bash

title=$'\e[94mdotfiles\e[0m'
start=$'\e[93m*\e[0m'
error=$'\e[91m-\e[0m'

run_command() {
    echo "[${title}] [${start}] $@"
    "$@"
    if (( $? != 0 )); then
        echo "[${title}] [${error}] $@"
    fi
}

echo "[${title}] Started: Configuration"

run_command sudo systemctl enable upower.service
run_command sudo systemctl enable udisks2.service
run_command sudo systemctl enable bluetooth.service
run_command sudo mkdir -p /home/programs
run_command sudo chown $USER:$USER /home/programs
run_command sudo cp -r ./etc/. /etc/
run_command sudo cp -r ./user/. /root/
run_command sudo ln -s -f /usr/bin/kitty /usr/bin/xdg-terminal-exec

run_command mkdir -p $HOME/Desktop
run_command mkdir -p $HOME/Downloads
run_command mkdir -p $HOME/Templates
run_command mkdir -p $HOME/Public
run_command mkdir -p $HOME/Documents
run_command mkdir -p $HOME/Projects
run_command mkdir -p $HOME/QemuVMs
run_command mkdir -p $HOME/Music
run_command mkdir -p $HOME/Pictures
run_command mkdir -p $HOME/Pictures/Screenshots
run_command mkdir -p $HOME/Videos

run_command cp -r ./user/. $HOME/
run_command cp -r ./local/. $HOME/.local/
run_command cp -r ./config/. $HOME/.config/

run_command gsettings set org.gnome.desktop.sound event-sounds "true"
run_command gsettings set org.gnome.desktop.interface gtk-enable-primary-paste "false"
run_command gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"
run_command gsettings set org.gnome.desktop.interface gtk-theme "Orchis-Dark"
run_command gsettings set org.gnome.desktop.interface icon-theme "Tela-circle-dark"
run_command gsettings set org.gnome.desktop.interface cursor-theme "Adwaita"
run_command gsettings set org.gnome.desktop.interface cursor-size "24"
run_command gsettings set org.gnome.desktop.interface font-name "Roboto 12"
run_command gsettings set org.gnome.desktop.interface document-font-name "Roboto 12"
run_command gsettings set org.gnome.desktop.interface monospace-font-name "JetBrains Mono NL 12"

run_command gsettings set org.xfce.mousepad.preferences.file session-restore "never"
run_command gsettings set org.xfce.mousepad.preferences.file add-last-end-of-line "false"
run_command gsettings set org.xfce.mousepad.preferences.view use-default-monospace-font "false"
run_command gsettings set org.xfce.mousepad.preferences.view font-name "JetBrains Mono NL Bold 12"
run_command gsettings set org.xfce.mousepad.preferences.view color-scheme "solarized-dark"
run_command gsettings set org.xfce.mousepad.preferences.view show-line-numbers "true"
run_command gsettings set org.xfce.mousepad.preferences.view highlight-current-line "true"

run_command xfconf-query --create -c ristretto -t bool -p "/window/toolbar/show" -s "true"
run_command xfconf-query --create -c ristretto -t bool -p "/window/statusbar/show" -s "true"
run_command xfconf-query --create -c ristretto -t bool -p "/window/thumbnails/show" -s "true"
run_command xfconf-query --create -c ristretto -t uint -p "/window/thumbnails/size" -s "3"
run_command xfconf-query --create -c ristretto -t string -p "/window/navigationbar/position" -s "bottom"
run_command xfconf-query --create -c ristretto -t string -p "/desktop/type" -s "none"

run_command xfconf-query --create -c thunar -t int -p "/last-separator-position" -s "230"
run_command xfconf-query --create -c thunar -t bool -p "/last-show-hidden" -s "true"
run_command xfconf-query --create -c thunar -t string -p "/last-side-pane" -s "THUNAR_SIDEPANE_TYPE_SHORTCUTS"
run_command xfconf-query --create -c thunar -t string -p "/last-location-bar" -s "ThunarLocationEntry"
run_command xfconf-query --create -c thunar -t string -p "/last-toolbar-items" -s "open-home:1,back:1,forward:1,reload:1,open-parent:1,location-bar:1,search:1,toggle-split-view:1"
run_command xfconf-query --create -c thunar -t string -p "/last-icon-view-zoom-level" -s "THUNAR_ZOOM_LEVEL_200_PERCENT"
run_command xfconf-query --create -c thunar -t string -p "/last-view" -s "ThunarIconView"
run_command xfconf-query --create -c thunar -t string -p "/default-view" -s "ThunarIconView"
run_command xfconf-query --create -c thunar -t string -p "/shortcuts-icon-size" -s "THUNAR_ICON_SIZE_32"
run_command xfconf-query --create -c thunar -t string -p "/misc-date-style" -s "THUNAR_DATE_STYLE_DDMMYYYY"
run_command xfconf-query --create -c thunar -t string -p "/misc-thumbnail-mode" -s "THUNAR_THUMBNAIL_MODE_NEVER"
run_command xfconf-query --create -c thunar -t string -p "/misc-exec-shell-scripts-by-default" -s "THUNAR_EXECUTE_SHELL_SCRIPT_NEVER"
run_command xfconf-query --create -c thunar -t bool -p "/misc-symbolic-icons-in-sidepane" -s "true"
run_command xfconf-query --create -c thunar -t bool -p "/misc-full-path-in-tab-title" -s "true"
run_command xfconf-query --create -c thunar -t bool -p "/misc-middle-click-in-tab" -s "true"
run_command xfconf-query --create -c thunar -t bool -p "/misc-show-delete-action" -s "true"
run_command xfconf-query --create -c thunar -t bool -p "/misc-volume-management" -s "false"

run_command xdg-settings set default-web-browser brave-browser-private.desktop

echo "[${title}] Finished: Configuration"

read -r -s -n 1 -p "[${title}] Press any key to continue..." && echo
