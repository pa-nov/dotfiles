#!/bin/bash

killall wofi

CONFIG="$HOME/.config/wofi"

wofi="wofi -c $CONFIG/clipboard.ini -s $CONFIG/clipboard.css"

cliphist=$(cliphist list)

if [[ "$cliphist" ]]; then
    last=$(echo -e "\nClear History")
    result=$(echo "$cliphist$last" | $wofi)
    if [[ "$result" == "Clear History" ]]; then
        if $CONFIG/confirm.sh "Delete all history?"; then
            wl-copy --clear
            rm $HOME/.cache/cliphist/db
        fi
    else
        if [[ "$result" ]]; then
            cliphist decode $result | wl-copy
        fi
    fi
else
    notify-send -u low -t 1000 "Clipboard is empty"
fi
