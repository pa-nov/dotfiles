#!/bin/bash

get_file_name() {
    printf "$GRIM_DEFAULT_DIR/Screenshot_$(date +"%Y.%m.%d_%H-%M-%S_%3N").png"
}

send_notification() {
    description="Screenshot copied to clipboard"
    if [[ "$1" ]]; then
        description+=" and saved as <b>${1/#$HOME/\~}</b>"
    fi
    canberra-gtk-play -i screen-capture &
    notify-send -t 4000 -c silent -i accessories-screenshot "Screenshot captured" "$description"
}

capture_region() {
    hyprpicker -r -z & sleep 0.1
    REGION=$(slurp -b "#000000C0" -B "#000000C0" -w 0)
    if [[ "$REGION" ]]; then
        hyprctl keyword cursor:invisible true; sleep 0.5
        grim -g "$REGION" -c - | wl-copy
        hyprctl keyword cursor:invisible false
        send_notification
    fi
    killall hyprpicker
}

capture_window() {
    while read -r line; do
        case "$line" in
            '"address":'*)
                ADDRESS=${line:12:-2} ;;
            '"at":'*)
                POSITION=${line:7:-2} ;;
            '"size":'*)
                SIZE=${line:9:-2} ;;
        esac
    done < <(hyprctl activewindow -j)
    if [[ "$ADDRESS" ]]; then
        REGION="${POSITION/, /,} ${SIZE/, /x}"
        hyprctl dispatch alterzorder top, address:$ADDRESS
        hyprctl dispatch setprop address:$ADDRESS rounding 0
        grim -g "$REGION" -c - | wl-copy
        hyprctl dispatch setprop address:$ADDRESS rounding unset
        send_notification
    fi
}

capture_screen() {
    hyprpicker -r -z & sleep 0.1
    REGION=$(slurp -b "#000000C0" -B "#000000C0" -w 0 -o -r)
    if [[ "$REGION" ]]; then
        hyprctl keyword cursor:invisible true; sleep 0.5
        FILE_NAME=$(get_file_name)
        grim -g "$REGION" -c "$FILE_NAME"
        hyprctl keyword cursor:invisible false
        wl-copy < "$FILE_NAME"
        send_notification "$FILE_NAME"
    fi
    killall hyprpicker
}

open_menu() {
    notify-send -i accessories-screenshot "Screenshot not captured" "Error: menu in development..."
}

case "$1" in
    "region")
        capture_region ;;
    "window")
        capture_window ;;
    "screen")
        capture_screen ;;
    "menu")
        open_menu ;;
    *)
        FILE_NAME=$(get_file_name)
        grim -c "$FILE_NAME"
        wl-copy < "$FILE_NAME"
        send_notification "$FILE_NAME"
        ;;
esac
