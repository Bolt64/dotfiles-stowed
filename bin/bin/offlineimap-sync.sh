#!/usr/bin/env bash

while pkill --signal 0 offlineimap
do
    echo "Process running"
    sleep 2
done
#offlineimap > ~/mail-log 2>&1 &
offlineimap 2> ~/.offlineimap-log
#offlineimap
