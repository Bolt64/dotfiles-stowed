#!/bin/bash

i3lock -d -i /home/sayantan/Pictures/lock_screen.png

dbus-send --system --print-reply \
    --dest="org.freedesktop.login1" \
    /org/freedesktop/login1 \
    org.freedesktop.login1.Manager.Suspend boolean:true

