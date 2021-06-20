-----------------------------------------------------------------------
--                      awesome theme                       --
--     origibally written by Adrian C. (anrxc)    --
--               adjusted by Bobby K.                  --
-----------------------------------------------------------------------

local theme_assets = require("beautiful.theme_assets")
local dpi = require("beautiful.xresources").apply_dpi

-- {{{ Main
local theme = {}
theme.wallpaper = theme_path .. "/background.jpg"
-- }}}



-- {{{ Styles

theme.font      = "Roboto 11"
theme.font_smaller = "Roboto 9.8"

-- {{{ Opacity
theme.opacity = 0.87
theme.opacity_lower = 0.95
-- }}}

-- {{{ Color collection
local blue_light = "#3992AF"
local blue_middle = "#005688"
local blue_dark = "#164B5D"

local grey_light = "#EEE9E9"
local grey_middle = "#777474"
local grey_dark = "#282C34"
local grey_verydark = "#1D1F21"

local red_decent = "#CC9393"
local red_light =  "#ED7572"
local red_middle = "#A5514F"
local red_dark = "#763A39"
-- }}}

-- {{{ Standard color assignment
theme.fg_normal  = grey_light
theme.fg_focus   = blue_light
theme.fg_urgent  = red_middle
theme.bg_normal  = grey_dark
theme.bg_focus   = grey_verydark
theme.bg_urgent  = grey_dark
theme.bg_systray = theme.bg_normal
-- }}}

-- {{{ Borders
theme.useless_gap   = dpi(4)
theme.border_width  = dpi(3)
theme.border_normal = "#33" .. string.sub (grey_verydark, -6)
theme.border_focus  = "#E6".. string.sub (grey_verydark, -6)
-- }}}

-- {{{ Titlebars
--theme.titlebar_bg_normal = theme.bg_normal
--theme.titlebar_bg_focus  = theme.bg_focus
-- }}}

--{{{ Taglist
theme.taglist_fg_focus    = theme.fg_focus
theme.taglist_bg_focus	  = theme.bg_normal
theme.taglist_fg_occupied = blue_dark
theme.taglist_fg_urgent   = theme.fg_urgent
theme.taglist_fg_empty    = grey_middle
theme.taglist_spacing     = 2
theme.taglist_font = "awesomewm-font 21"
--}}}

--}}}



-- {{{ Widgets
-- You can add as many variables as you wish and access them by using beautiful.variable in your rc.lua
theme.fg_widget = theme.fg_normal
--theme.fg_center_widget = "#88A175"
--theme.fg_end_widget    = "#FF5656"
theme.bg_widget = theme.bg_normal
theme.border_widget = theme.border_focus
    --{{{Hotkeys widget
    theme.hotkeys_bg = theme.bg_normal
    theme.hotkeys_opacity = theme.opacity_lower
    theme.hotkeys_fg = theme.fg_normal
    theme.hotkeys_border_width = theme.border_width
    theme.hotkeys_border_color = theme.border_focus
    theme.hotkeys_font = theme.font
    theme.hotkeys_description_font = theme.font_smaller
    theme.hotkeys_group_margin = 20
-- }}}



-- {{{ Menu
theme.menu_height = dpi(25)
theme.menu_width  = dpi(200)
theme.menu_bg_normal = theme.bg_normal
theme.menu_bg_focus = theme.bg_focus
theme.menu_fg_normal = theme.fg_normal
theme.menu_fg_focus = theme.fg_focus
theme.menu_border_width = 0
theme.awesome_icon = false
theme.menu_submenu_icon = theme_path .. "/submenu.png"
-- }}}



-- {{{ Layout Icons
theme.layout_tile       = theme_path .. "/layouts/tile.png"
theme.layout_tileleft   = theme_path .. "/layouts/tileleft.png"
theme.layout_tilebottom = theme_path .. "/layouts/tilebottom.png"
theme.layout_tiletop    = theme_path .. "/layouts/tiletop.png"
theme.layout_fairv      = theme_path .. "/layouts/fairv.png"
theme.layout_fairh      = theme_path .. "/layouts/fairh.png"
theme.layout_spiral     = theme_path .. "/layouts/spiral.png"
theme.layout_dwindle    = theme_path .. "/layouts/dwindle.png"
theme.layout_max        = theme_path .. "/layouts/max.png"
theme.layout_fullscreen = theme_path .. "/layouts/fullscreen.png"
theme.layout_magnifier  = theme_path .. "/layouts/magnifier.png"
theme.layout_floating   = theme_path .. "/layouts/floating.png"
theme.layout_cornernw   = theme_path .. "/layouts/cornernw.png"
theme.layout_cornerne   = theme_path .. "/layouts/cornerne.png"
theme.layout_cornersw   = theme_path .. "/layouts/cornersw.png"
theme.layout_cornerse   = theme_path .. "/layouts/cornerse.png"
-- }}}

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
