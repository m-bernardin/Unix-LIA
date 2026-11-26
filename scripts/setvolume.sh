#!/bin/bash

read -p "Enter volume (1-100): " volume

if ! [[ "$volume" =~ ^[0-9]+$ ]] || (( volume < 1 || volume > 100 )); then
    echo "Invalid volume."
    exit 1
fi

converted_volume=$(( volume * 256 / 100 ))
vlc --volume="$converted_volume"
echo "Volume set to $volume%"
