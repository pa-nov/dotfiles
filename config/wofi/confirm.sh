#!/bin/bash

killall wofi

CONFIG="$HOME/.config/wofi"

wofi="wofi -c $CONFIG/confirm.ini -s $CONFIG/confirm.css"

if [[ "$1" ]]; then
    prompt="$1"
else
    prompt="Are you sure?"
fi

if [[ $(echo -e "Yes\nNo" | $wofi --prompt="$prompt") == "Yes" ]]; then
    echo "true"
    exit 0
else
    echo "false"
    exit 1
fi
