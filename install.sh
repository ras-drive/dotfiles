#!/bin/bash

if ! type pacman &> /dev/null
then
	echo "not running on arch linux!"
	exit 1
fi

sudo paru -S --needed i3-wm i3status rofi alacritty xorg-xrandr nitrogen


echo "setting wallpaper"
nitrogen ~/wallpaper.png && echo "wallpaper set" || echo "error setting wallpaper"


