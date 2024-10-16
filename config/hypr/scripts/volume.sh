#!/bin/bash

old=""

pactl subscribe | grep --line-buffered "Event 'change' on sink" | while read -r event; do
    volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2}')
    muted=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')
    value=$(echo "$volume 100" | awk '{print $1*$2}')
    if [ "$old" != "$muted $value" ]; then
        old="$muted $value"
        if [ "$muted" == "yes" ]; then
            notify-send -u low -t 1000 -h int:value:$value -r 1000 "Volume: Muted"
        else
            notify-send -u low -t 1000 -h int:value:$value -r 1000 "Volume: $value%"
        fi
    fi
done
