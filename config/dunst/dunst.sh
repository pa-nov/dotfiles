#!/bin/bash

if [[ "$DUNST_CATEGORY" != "silent" ]]; then
    if [[ "$DUNST_URGENCY" == "LOW" ]]; then
        canberra-gtk-play -i dialog-information
    elif [[ "$DUNST_URGENCY" == "NORMAL" ]]; then
        canberra-gtk-play -i message
    elif [[ "$DUNST_URGENCY" == "CRITICAL" ]]; then
        canberra-gtk-play -i dialog-warning
    fi
fi
