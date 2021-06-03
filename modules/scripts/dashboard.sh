#!/usr/bin/env bash

# define some programms
	if [ "$HOSTNAME" = "debrob" ]; then
        data_explorer="thunar"
	fi

	if [ "$HOSTNAME" = "robdora" ]; then
        data_explorer="dolphin"
	fi


# function to toggle Conky visibility
conky_visible() {
	awesome-client '
	awful = require("awful")
	
	local conky = function (c)
	  return awful.rules.match(c, {class = "Conky"})
	end

	for c in awful.client.iterate(conky) do
	  c.hidden = not c.hidden
	end
	'
}

# function to delete _NET_STARTUP_ID -> rofi background will be blurred again
delete_STARTUP_ID() {
	myid=$(xdotool search --sync --onlyvisible --class "rofi")
	xprop -id $myid -remove _NET_STARTUP_ID
}


# "Build dashboard"
	
	conky_visible & call=$(rofi -dmenu -theme prompt.rasi)
	conky_visible
	
# evaluate $call
case $call in
	# mlocate query: q query path(h=$HOME)
	"q "*)
		read -ra arguments <<< "$call"
		case ${arguments[2]} in
			"") call=$(locate -i -b "${arguments[1]}") ;;
			"h") call=$(locate -i "$HOME"*"${arguments[1]}") ;;
			*) call=$(locate -i "${arguments[2]}"*"${arguments[1]}") ;;
		esac
		# show search results in another rofi menu as bigger sidebar
		delete_STARTUP_ID & call=$(echo "$call" | rofi -dmenu -i -theme main.rasi -theme-str '#window { width: 100%; }')
		# open selected file with data_explorer (if any file is selected)
		if [ "$call" != "" ]
			then "$data_explorer" "$call"
		fi
		;;


	# else: try call as command
	*)
		$call
		;;
esac
