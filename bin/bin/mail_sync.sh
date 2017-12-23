#!/bin/bash

while :
do
    AC_STATUS=`cat /sys/class/power_supply/AC/online`
    if [ $AC_STATUS -eq 1 ]; then
        echo "Syncing";
        ~/bin/offlineimap-sync.sh;
        echo "Sync done";
    fi
    sleep 5m
done
