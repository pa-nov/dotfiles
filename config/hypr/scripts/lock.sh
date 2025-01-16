#!/bin/bash

result=$(~/.config/hypr/scripts/confirm.sh "Lock the screen now?")

if [ "$result" == "Yes" ]; then
    hyprlock
fi
