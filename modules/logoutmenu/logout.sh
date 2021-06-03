#!/usr/bin/env bash

# function to print options in different lines to get different dmenu entrys
print_actions() {
	for action in "${!actions[@]}"
		do
			echo "$action"
		done
}

# assotiative array to hold [key] (this is shown in the menu) and action to take
declare -A actions
actions=(
	["		poweroff"]="systemctl poweroff"
	["♻		reboot"]="systemctl reboot"
	["		sleep"]="systemctl suspend"
	["		logout"]="awesome-client 'function() awesome.quit() end'"
	["		lock"]="i3lock -i $(dirname $0)/lockscreen.png"
	["		screen off"]="/usr/bin/xset dpms force off"
)

# Show menu until a defined action was selected or "ESC" was pressed (-> exit status 1)
controller=false
until [ $controller = true ]
	do
	# show dmenu and store selection and exit status
	call=$(print_actions | rofi -dmenu -theme main.rasi -theme-str '#element-text { font: "Roboto light 17"; }' -theme-str '#element { padding: 25px; }'  -matching fuzzy)
	exitstatus=$?
	
	# check rofi exit status and $call
	 case $exitstatus in
		# leave when user wanted to
		1)	controller=true
			;;
		# take a action if it is defined in actions array
		0)	if [ ${actions[$call]+_} ]
				then	${actions[$call]}
						controller=true
			fi
			;;
	esac
done
