#!/usr/bin/env bash

### use this script to change awesomewm theme ###

# list available themes
echo "available themes:"
ls $HOME/.config/awesome/themes

# ask for theme name
read -p "choose theme: " theme

# change theme in rc.lua
sed -i 's/theme_path = HOME.."\/themes\/.*"/theme_path = HOME.."\/themes\/'$theme'"/' $HOME/.config/awesome/rc.lua

# set softlinks to rofi configuration files
	# ask for screen resolution
	read -p "choose your screen y size (either 1080 or 1200): " screen
	
	# create link to main ("sidebar") configuration file
	cd $HOME/.config/rofi/
	ln -si $HOME/.config/awesome/themes/$theme/rofi/main_$screen.rasi main.rasi
	# create link to prompt configuration file
	ln -si $HOME/.config/awesome/themes/$theme/rofi/prompt.rasi prompt.rasi
	# create link to globals text file
	ln -si $HOME/.config/awesome/themes/$theme/rofi/globals.rasi globals.rasi
