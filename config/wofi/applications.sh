#!/bin/bash

killall wofi

CONFIG="$HOME/.config/wofi"

wofi="wofi -c $CONFIG/applications.ini -s $CONFIG/applications.css"

if [[ "$1" == "--waybar" ]]; then
    $wofi --location 1 -H 90% -x 4 -y 4
else
    $wofi
fi
