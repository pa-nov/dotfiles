#!/bin/bash

result=$(~/.config/hypr/scripts/confirm.sh "Log out of your session now?")

if [ "$result" == "Yes" ]; then
    hyprctl dispatch exit
fi
