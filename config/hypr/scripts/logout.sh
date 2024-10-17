#!/bin/bash

result=$(~/.config/hypr/scripts/confirm.sh "Log out now?")

if [ "$result" == "Yes" ]; then
    hyprctl dispatch exit
fi
