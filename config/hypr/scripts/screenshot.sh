#!/bin/bash

FILE_NAME="$HOME/Pictures/Screenshots/Screenshot_$(date +"%Y.%m.%d_%H-%M-%S").png"

grim "$FILE_NAME" && notify-send -u low -t 2000 "Screenshot saved" "Screenshot has been saved to $FILE_NAME"
