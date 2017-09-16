#!/bin/sh

i3status | while :
do
    read line
    echo "`get_song.py` $line" || exit 1
done
