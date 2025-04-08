#!/bin/bash

notify-send -r 2 -u low -t 1 "Volume"

get_volume() {
    wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2}'
}

get_muted() {
    wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $3}'
}

previous="$(get_volume) $(get_muted)"

pactl subscribe | grep --line-buffered "Event 'change' on sink" | while read -r; do
    volume=$(get_volume)
    muted=$(get_muted)
    if [[ "$previous" != "$volume $muted" ]]; then
        previous="$volume $muted"
        value=$(echo "$volume 100" | awk '{print $1*$2}')
        if [[ "$muted" ]]; then
            notify-send -r 2 -u low -t 1000 -h int:value:$value "Volume: Muted"
        else
            notify-send -r 2 -u low -t 1000 -h int:value:$value "Volume: $value%"
        fi
    fi
done
