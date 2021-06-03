#!/usr/bin/env bash

function run {
  if ! pgrep -f $1 ;
	then
		$@&
  fi
}

# List programms here (run PROGRAMM [some arguments])

	# Autostart applications for machine "debrob" 
	if [ "$HOSTNAME" = "debrob" ]; then
	run /usr/share/LRZ_Sync_Share/LRZ_Sync_Share-Client.sh
	run nm-applet
	fi

	# Autostart applications for machine "robdora" 
	if [ "$HOSTNAME" = "robdora" ]; then
	run /home/robert/.opt/LRZ_Sync_Share/LRZ_Sync_Share-Client.sh
	fi
