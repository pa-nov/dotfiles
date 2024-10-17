#!/bin/bash

result=$(~/.config/hypr/scripts/confirm.sh "Lock the screen?")

if [ "$result" == "Yes" ]; then
    hyprlock
fi
