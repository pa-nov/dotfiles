#!/bin/bash

WOFI_DIR="$(dirname "$(realpath "$0")")"
WOFI="wofi -c $WOFI_DIR/confirm.ini -s $WOFI_DIR/confirm.css"

if [[ "$1" ]]; then
    prompt="$1"
else
    prompt="Are you sure?"
fi

canberra-gtk-play -i dialog-warning &

if [[ "$($WOFI --prompt "$prompt" <<< $'Yes\nNo')" == "Yes" ]]; then
    echo "true"
    exit 0
else
    echo "false"
    exit 1
fi
