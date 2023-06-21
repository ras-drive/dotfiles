#!/bin/bash

install_paru () {
	echo "installing paru"
	cd ~/ || exit
	git clone https://aur.archlinux.org/paru.git
	cd paru || exit
	makepkg -si
}

if ! type pacman &> /dev/null
then
	echo "not running on arch linux!"
	exit 1
fi

if ! type paru &> /dev/null
then
	read -rp "paru is not installed, would you like to install it?" yn
	case $yn in
        [Yy]* ) install_paru;;
        [Nn]* ) exit 1;;
        * ) echo "Please answer yes or no.";;
    esac
fi

echo "installing needed packages"
sudo paru -S --needed i3-wm i3status rofi alacritty xorg-xrandr nitrogen ttf-jetbrains-mono

echo "setting wallpaper"
nitrogen ~/wallpaper.png && echo "wallpaper set" || echo "error setting wallpaper, default wallpaper location is ~/wallpaper.png"
