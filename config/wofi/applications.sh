#!/bin/bash

WOFI_DIR="$(dirname "$(realpath "$0")")"
WOFI="wofi -c $WOFI_DIR/applications.ini -s $WOFI_DIR/applications.css"

(( $(pkill -c -f "$WOFI") > 0 )) && exit 0

if [[ "$1" == "--waybar" ]]; then
    $WOFI --location 1 --height 90% -x 4 -y 4
else
    $WOFI
fi
