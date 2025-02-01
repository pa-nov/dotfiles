#!/bin/bash

killall wofi

CONFIG="$HOME/.config/wofi"

clipboard="wofi -c $CONFIG/clipboard.conf -s $CONFIG/clipboard.css $@"
result=$(echo -e "$(cliphist list)\nClear History" | $clipboard)

if [ "$result" == "Clear History" ]; then
    result=$($HOME/.config/hypr/scripts/confirm.sh "Delete all history?")

    if [ "$result" == "Yes" ]; then
        wl-copy < /dev/null
        rm $HOME/.cache/cliphist/db
    fi
else
    cliphist decode $result | wl-copy
fi
