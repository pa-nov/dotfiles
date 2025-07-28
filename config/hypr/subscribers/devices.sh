#!/bin/bash

while read -r line; do
    if [[ "$line" == *"add"* ]]; then
        canberra-gtk-play -i device-added &
    elif [[ "$line" == *"remove"* ]]; then
        canberra-gtk-play -i device-removed &
    fi
done < <(udevadm monitor --udev --subsystem-match usb/usb_device)
