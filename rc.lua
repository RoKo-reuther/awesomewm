-- Load official librarys
    local awful = require("awful")
    require("awful.autofocus")
    local beautiful = require("beautiful")



-- Set up awesome configuration folder and hostname
    HOME = "/home/robert/.config/awesome"
    HOST = io.popen("hostname"):read()


    
--  load configurations and modules
    --  Set up theme
		theme_path = HOME.."/themes/awesome_cornered"
        beautiful.init(theme_path.."/theme.lua")
        -- add theme_path to package.path to find wibar
        package.path = package.path .. ";"..theme_path.."/?.lua;"
        
    -- load theme-corresponding wibar
        require("wibar.wibar")
    
    -- Set bindings
        -- global keybindings
            root.keys(require("configuration.bindings").globalkeys)
        -- client keybindings
            clientkeys = require("configuration.bindings").clientkeys
        --  mouse bindings
            root.buttons(require("configuration.bindings").mousebindings)
            
    -- Set default programms
        require("configuration.default_programms")
        
    -- Load used layouts
        require("configuration.layouts")
        
    -- Load autostart
        require("configuration.autostart.autostart")

    -- load client rules
        require("configuration.client.rules")
	
    -- load menu
        require("modules.menu.menu")



-- {{{ Signal functions
            
    -- Reset wallpaper when a screen's geometry changes (e.g. different resolution)
        screen.connect_signal( "property::geometry", function(s) beautiful.wallpaper.maximized( beautiful.wallpaper, s, beautiful.wallpapers) end )

    -- Signal function to execute when a new client appears.
        client.connect_signal("manage", function (c)
        -- Set the windows at the slave, i.e. put it at the end of others instead of setting it master.
            if not awesome.startup then awful.client.setslave(c) end
       -- Prevent clients from being unreachable after screen count changes.
            if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_offscreen(c)
            end
        end )


    -- Enable sloppy focus, so that focus follows mouse.
        client.connect_signal("mouse::enter", function(c)
            c:emit_signal("request::activate", "mouse_enter", {raise = false})
        end )

        
    -- Make the focused window have a different border
        client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
        client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
      
	-- No borders when rearranging only 1 non-floating or maximized client
		screen.connect_signal("arrange", function (s)
		  local only_one = #s.tiled_clients == 1
		  for _, c in pairs(s.clients) do
			if only_one and not c.floating or c.maximized then
			  c.border_width = 0
			else
			  c.border_width = beautiful.border_width
			end
		  end
		end )
        
-- }}}

