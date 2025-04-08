#!/bin/bash

value=$(brightnessctl -m | awk -F , '{print $4}')

notify-send -r 1 -u low -t 1000 -h int:value:${value:0:-1} "Brightness: $value"
