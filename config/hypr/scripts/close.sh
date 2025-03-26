#!/bin/bash

if [[ "$(hyprctl clients -j)" != "[]" ]]; then
    hyprctl dispatch killactive
else
    $HOME/.config/hypr/scripts/poweroff.sh
fi
