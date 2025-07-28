#!/bin/bash

send_notification() {
    volume=$(awk '{print $0 * 100}' <<< "$1")
    muted=$2
    text="${volume}%"
    icon="audio-volume"
    if [[ "$muted" ]]; then
        text="Muted"
        icon+="-muted-blocking"
    elif (( volume == 0 )); then
        icon+="-muted"
    elif (( volume < 33 )); then
        icon+="-low"
    elif (( volume < 66 )); then
        icon+="-medium"
    else
        icon+="-high"
    fi
    notify-send -r 2 -t 1000 -u low -c silent -i $icon -h int:value:$volume "Volume: ${text}"
}

notify-send -r 2 -t 1 -u low -c silent "Volume"
previous=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2, $3}')

while read -r line; do
    if [[ "$line" == "Event 'change' on sink"* ]]; then
        current=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2, $3}')
        if [[ "$previous" != "$current" ]]; then
            previous=$current
            send_notification $current
        fi
    fi
done < <(pactl subscribe)
