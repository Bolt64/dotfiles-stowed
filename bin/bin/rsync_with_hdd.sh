#!/bin/bash

echo "Syncing Music"
rsync -rvu /home/bolt/Music/ /run/media/bolt/aaedbdd8-a511-4c01-bac6-8c41f582d94b/Music/
echo ""

echo "Syncing eBooks"
rsync -rvu /home/bolt/eBooks/ /run/media/bolt/aaedbdd8-a511-4c01-bac6-8c41f582d94b/eBooks/
echo ""

echo "Syncing Archives"
rsync -rvu /home/bolt/Archives/ /run/media/bolt/aaedbdd8-a511-4c01-bac6-8c41f582d94b/Archives/
echo ""

echo "Syncing Pictures"
rsync -rvu /home/bolt/Pictures/ /run/media/bolt/aaedbdd8-a511-4c01-bac6-8c41f582d94b/Pictures/
echo ""

echo "Syncing Videos"
rsync -rvu /home/bolt/Videos/ /run/media/bolt/aaedbdd8-a511-4c01-bac6-8c41f582d94b/Videos/
echo ""

echo "Syncing .ssh"
rsync -rvu /home/bolt/.ssh/ /run/media/bolt/aaedbdd8-a511-4c01-bac6-8c41f582d94b/.ssh/
echo ""

echo "Syncing to_read"
rsync -rvu /home/bolt/Downloads/to_read/ /run/media/bolt/aaedbdd8-a511-4c01-bac6-8c41f582d94b/to_read/
echo ""
