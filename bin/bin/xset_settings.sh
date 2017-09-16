#!/bin/bash

while true; do
    export DISPLAY=":0"
    xset s off
    xset s noblank
    xset -dpms
    sleep 60
done
