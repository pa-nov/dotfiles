#!/bin/bash

result=$(~/.config/hypr/scripts/confirm.sh "Turn off the computer now?")

if [ "$result" == "Yes" ]; then
    systemctl poweroff
fi
