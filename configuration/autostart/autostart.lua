local awful = require('awful')

-- There are two "autostart-types"!!!
-- Type 1 programms only should be started once at login. Type 2 programms will be restarted every time awesome restarts


	-- Type 1 programms are prevented from starting again, if they are already running.
	-- They are started with an extra script. Add such programms in script "./autorun.sh"
		awful.spawn.with_shell( HOME .. "/configuration/autostart/autorun.sh") 



	-- Type 2 autostart applications will be restarted every time awesome restarts. They can be added here
		
		-- Type 2 autostart applications for machine "debrob"
		if HOST == "debrob" then
			awful.spawn.with_shell("compton -b")
			awful.spawn.with_shell("killall conky")
			awful.spawn.once("conky")
		end


		-- Type 2 autostart applications for machine "robdora"
		if HOST == "robdora" then
			awful.spawn.with_shell("picom -b")
			awful.spawn.with_shell("killall conky")
			awful.spawn.once("conky")
		end
