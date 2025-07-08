#!/bin/bash

WOFI_DIR="$(dirname "$(realpath "$0")")"
WOFI="wofi -c $WOFI_DIR/dunst.ini -s $WOFI_DIR/dunst.css"

$WOFI
