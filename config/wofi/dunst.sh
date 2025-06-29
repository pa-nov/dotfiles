#!/bin/bash

killall wofi

CONFIG="$HOME/.config/wofi"

wofi="wofi -c $CONFIG/dunst.ini -s $CONFIG/dunst.css"

$wofi
