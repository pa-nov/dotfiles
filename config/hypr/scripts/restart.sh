#!/bin/bash

result=$($HOME/.config/wofi/confirm.sh "Restart computer now?")

if [[ "$result" == "true" ]]; then
    systemctl reboot
fi
