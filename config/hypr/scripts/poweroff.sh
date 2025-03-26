#!/bin/bash

result=$($HOME/.config/wofi/confirm.sh "Turn off computer now?")

if [[ "$result" == "true" ]]; then
    systemctl poweroff
fi
