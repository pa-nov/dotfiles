#!/bin/bash

WOFI_DIR="$(dirname "$(realpath "$0")")"
WOFI="wofi -c $WOFI_DIR/clipboard.ini -s $WOFI_DIR/clipboard.css"

(( $(pkill -c -f "$WOFI") > 0 )) && exit 0

history="$(cliphist list)"

if [[ "$history" ]]; then
    result="$($WOFI <<< "$history"$'\nClear History')"
    if [[ "$result" == "Clear History" ]]; then
        if $WOFI_DIR/confirm.sh "Delete all history?"; then
            wl-copy --clear
            rm $HOME/.cache/cliphist/db
        fi
    else
        if [[ "$result" ]]; then
            wl-copy < <(cliphist decode "$result")
        fi
    fi
else
    notify-send -t 1500 -u low -i clipboard "Clipboard is empty"
fi
