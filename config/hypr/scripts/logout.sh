#!/bin/bash

result=$($HOME/.config/wofi/confirm.sh "Log out of this session now?")

if [[ "$result" == "true" ]]; then
    hyprctl dispatch exit
fi
