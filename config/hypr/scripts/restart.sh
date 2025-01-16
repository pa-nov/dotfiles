#!/bin/bash

result=$(~/.config/hypr/scripts/confirm.sh "Restart the computer now?")

if [ "$result" == "Yes" ]; then
    systemctl reboot
fi
