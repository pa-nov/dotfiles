#!/bin/bash

result=$(~/.config/hypr/scripts/confirm.sh "Power off computer now?")

if [ "$result" == "Yes" ]; then
    systemctl poweroff
fi
