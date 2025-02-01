#!/bin/bash

killall wofi

CONFIG="$HOME/.config/wofi"

wofi -c $CONFIG/applications.conf -s $CONFIG/applications.css $@
