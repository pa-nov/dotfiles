#!/bin/bash

send_notification() {
    brightness=$1
    if (( brightness > 0 )); then
        icon="gpm-brightness-lcd"
    else
        icon="gpm-brightness-lcd-disabled"
    fi
    notify-send -r 4 -t 1000 -u low -c silent -i $icon -h int:value:$brightness "Brightness: ${brightness}%"
}

if [[ "$1" == "send" ]]; then
    current=$(brightnessctl --machine-readable | awk -F , '{print $4}')
    send_notification ${current:0:-1}
    exit 0
fi

notify-send -r 4 -t 1 -u low -c silent "Brightness"

SCRIPT_DIR="$(dirname "$(realpath "$0")")"
systemctl --user link --force $SCRIPT_DIR/systemd/subscriber-brightness.path
systemctl --user link --force $SCRIPT_DIR/systemd/subscriber-brightness.service
systemctl --user start subscriber-brightness.path
