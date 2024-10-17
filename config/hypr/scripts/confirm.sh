#!/bin/bash

if [ "$1" != "" ]; then
    prompt="$1"
else
    prompt="Are you sure?"
fi

echo -e "Yes\nNo" | wofi -c ~/.config/wofi/confirm.conf -s ~/.config/wofi/confirm.css --prompt="$prompt"
