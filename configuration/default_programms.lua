-- Default programms for machine "debrob"
    if HOST == "debrob" then
	terminal = "xfce4-terminal"
	editor = os.getenv("EDITOR") or "nano"
	editor_cmd = terminal .. " -e " .. editor
	file_manager = "thunar"
	browser = "firefox"
    end


-- Default programms for machine "robdora"
    if HOST == "robdora" then
	terminal = "alacritty"
	editor = os.getenv("EDITOR") or "nano"
	editor_cmd = terminal .. " -e " .. editor
	file_manager = "dolphin"
	browser = "firefox"
    end
