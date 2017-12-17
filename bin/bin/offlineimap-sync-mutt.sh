#!/usr/bin/env bash

if pkill --signal 0 offlineimap; then
    echo "offlineimap running"
    sleep 2
else
    echo "Starting offlineimap"
    offlineimap
fi
