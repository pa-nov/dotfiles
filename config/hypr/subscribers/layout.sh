#!/bin/bash

send_notification() {
    notify-send -r 1 -t 1000 -u low -c silent -i input-keyboard "Layout: $1"
}

notify-send -r 1 -t 1 -u low -c silent "Layout"

while read -r line; do
    if [[ "$line" == "activelayout"* ]]; then
        layout=$(awk -F , '{print $2}' <<< "$line")
        send_notification "$layout"
    fi
done < <(socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock)
