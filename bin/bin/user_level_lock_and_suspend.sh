#!/bin/bash

i3lock -d -i /home/bolt/Pictures/lock_screen.png
#/home/bolt/bin/fancy_lock/lock

#dbus-send --system --print-reply \
#    --dest="org.freedesktop.UPower" \
#    /org/freedesktop/UPower \
#    org.freedesktop.UPower.Suspend

dbus-send --system --print-reply \
    --dest="org.freedesktop.login1" \
    /org/freedesktop/login1 \
    org.freedesktop.login1.Manager.Suspend boolean:true

