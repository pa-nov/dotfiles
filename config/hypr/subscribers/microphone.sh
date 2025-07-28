#!/bin/bash

send_notification() {
    volume=$(awk '{print $0 * 100}' <<< "$1")
    muted=$2
    text="${volume}%"
    icon="mic-volume"
    if [[ "$muted" ]]; then
        text="Muted"
        icon+="-muted"
    elif (( volume == 0 )); then
        icon="mic-ready"
    elif (( volume < 33 )); then
        icon+="-low"
    elif (( volume < 66 )); then
        icon+="-medium"
    else
        icon+="-high"
    fi
    notify-send -r 3 -t 1000 -u low -c silent -i $icon -h int:value:$volume "Microphone: ${text}"
}

notify-send -r 3 -t 1 -u low -c silent "Microphone"
previous=$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | awk '{print $2, $3}')

while read -r line; do
    if [[ "$line" == "Event 'change' on source"* ]]; then
        current=$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | awk '{print $2, $3}')
        if [[ "$previous" != "$current" ]]; then
            previous=$current
            send_notification $current
        fi
    fi
done < <(pactl subscribe)
