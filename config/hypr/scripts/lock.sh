#!/bin/bash

result=$($HOME/.config/wofi/confirm.sh "Lock screen now?")

if [[ "$result" == "true" ]]; then
    hyprlock
fi
