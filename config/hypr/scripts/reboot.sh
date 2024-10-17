#!/bin/bash

result=$(~/.config/hypr/scripts/confirm.sh "Reboot computer now?")

if [ "$result" == "Yes" ]; then
    systemctl reboot
fi
