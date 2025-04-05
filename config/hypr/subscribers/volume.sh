#!/bin/bash

get_volume() {
    wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2}'
}

get_muted() {
    pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}'
}

previous="$(get_volume) $(get_muted)"

pactl subscribe | grep --line-buffered "Event 'change' on sink" | while read -r event; do
    volume=$(get_volume)
    muted=$(get_muted)
    if [[ "$previous" != "$volume $muted" ]]; then
        previous="$volume $muted"
        value=$(echo "$volume 100" | awk '{print $1*$2}')
        if [[ "$muted" == "yes" ]]; then
            notify-send -u low -t 1000 -h int:value:$value -r 10000 "Volume: Muted"
        else
            notify-send -u low -t 1000 -h int:value:$value -r 10000 "Volume: $value%"
        fi
    fi
done
