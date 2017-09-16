#!/bin/bash

echo "Syncing Music"
rsync -rvu /home/bolt/Music/ /run/media/bolt/8d93870c-98d9-48a5-8ad4-beb987f73b27/bolt/Music/
echo ""

echo "Syncing eBooks"
rsync -rvu /home/bolt/eBooks/ /run/media/bolt/8d93870c-98d9-48a5-8ad4-beb987f73b27/bolt/eBooks/
echo ""

echo "Syncing Pictures"
rsync -rvu /home/bolt/Pictures/ /run/media/bolt/8d93870c-98d9-48a5-8ad4-beb987f73b27/bolt/Pictures/
echo ""

echo "Syncing .ssh"
rsync -rvu /home/bolt/.ssh/ /run/media/bolt/8d93870c-98d9-48a5-8ad4-beb987f73b27/bolt/.ssh/
echo ""
