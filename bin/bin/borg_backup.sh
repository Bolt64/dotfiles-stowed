#!/bin/sh
REPOSITORY=/run/media/bolt/aaedbdd8-a511-4c01-bac6-8c41f582d94b/Backups

borg create -v --progress --compression lzma,5      \
            --stats                                 \
    $REPOSITORY::'{hostname}-{now:%Y-%m-%d-%s}'     \
    /home/bolt                                      \
    --exclude /home/bolt/.cache                     \
    --exclude /home/bolt/Music                      \
    --exclude /home/bolt/Videos                     
    #--exclude /home/bolt/.mozilla                   \
    #--exclude /home/bolt/.config/chromium-backup    \
    #--exclude /home/bolt/.config/chromium-back-ovfs \
    #--exclude /home/bolt/temp                       \

# Use the `prune` subcommand to maintain 7 daily, 4 weekly and 6 monthly
# archives of THIS machine. The '{hostname}-' prefix is very important to
# limit prune's operation to this machine's archives and not apply to
# other machine's archives also.
borg prune -v --list $REPOSITORY --prefix '{hostname}-' \
    --keep-daily=100 --keep-weekly=50 --keep-monthly=20
