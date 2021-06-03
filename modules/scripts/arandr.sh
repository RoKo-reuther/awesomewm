#!/usr/bin/env bash


# function to get name of layout-scripts from ARandR directory
# It also adds a ARandR-entry at first
get_layouts() {
	echo "ARandR"
	for file in $HOME/.screenlayout/* ; do
		file=$(basename $file)
		echo ${file%.*}
	done
	}

# selection gets the name of chosen rofi entry
# rofi takes ouput of get_layout function as inout in -dmenu mode
selection=$(get_layouts | rofi -dmenu -theme main.rasi -i)

# check selection and take a action
if [ $selection = "ARandR" ] ; 
	then
		arandr
	else
		$HOME/.screenlayout/$selection.sh
fi
