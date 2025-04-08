#!/bin/bash

notify-send -r 3 -u low -t 1 "Microphone"

get_volume() {
    wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | awk '{print $2}'
}

get_muted() {
    wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | awk '{print $3}'
}

previous="$(get_volume) $(get_muted)"

pactl subscribe | grep --line-buffered "Event 'change' on source" | while read -r; do
    volume=$(get_volume)
    muted=$(get_muted)
    if [[ "$previous" != "$volume $muted" ]]; then
        previous="$volume $muted"
        value=$(echo "$volume 100" | awk '{print $1*$2}')
        if [[ "$muted" ]]; then
            notify-send -r 3 -u low -t 1000 -h int:value:$value "Microphone: Muted"
        else
            notify-send -r 3 -u low -t 1000 -h int:value:$value "Microphone: $value%"
        fi
    fi
done
