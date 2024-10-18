#!/bin/bash

if [ "$(hyprctl clients -j)" != "[]" ]; then
    hyprctl dispatch killactive
else
    ~/.config/hypr/scripts/poweroff.sh
fi
