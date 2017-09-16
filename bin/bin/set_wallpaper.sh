#!/bin/bash

rm ~/Pictures/wallpaper.png
ln -sv `pwd`/$1 ~/Pictures/wallpaper.png
feh --bg-fill /home/bolt/Pictures/wallpaper.png 
