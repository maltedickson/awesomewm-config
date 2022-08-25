
--    ▞▀▖      ▛▀▖      ▌   ▀▛▘▌
--    ▌ ▌▛▀▖▞▀▖▌ ▌▝▀▖▙▀▖▌▗▘  ▌ ▛▀▖▞▀▖▛▚▀▖▞▀▖
--    ▌ ▌▌ ▌▛▀ ▌ ▌▞▀▌▌  ▛▚   ▌ ▌ ▌▛▀ ▌▐ ▌▛▀
--    ▝▀ ▘ ▘▝▀▘▀▀ ▝▀▘▘  ▘ ▘  ▘ ▘ ▘▝▀▘▘▝ ▘▝▀▘

local theme_assets = require("beautiful.theme_assets")
local gears = require("gears")
local awful = require("awful")

local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()
local config_path = gfs.get_configuration_dir()

local clr = {}

clr.mono_1 = "#abb2bf" -- default text
clr.mono_2 = "#828997"
clr.mono_3 = "#5c6370"
clr.mono_4 = "#626d84" -- @syntax-gutter

clr.bg_light = "#333842"
clr.bg = "#282c34"
clr.bg_dark = "#21252b"

clr.border = "#181a1f"

clr.cyan = "#56b6c2" -- <-cyan @hue-1
clr.blue = "#61afef" -- <-blue @hue-2
clr.blue_alt = "#528bff" -- @syntax-accent
clr.purple = "#c678dd" -- <-purple @hue-3
clr.green = "#97c278" -- <-green @hue-4
clr.red = "#e06c75" -- <-red 1 @hue-5
clr.red_alt = "#be5046" -- <-red 2 @hue-5-2
clr.orange = "#d19a66" -- <-orange 1 @hue-6
clr.orange_alt = "#e5c07b" -- <-orange 2 @hue-6-2
clr.transparent = "#00000000"

local theme = {}

theme.path = config_path .. "themes/onedark/"

theme.font = "Jetbrains Mono 10"


theme.useless_gap = 4

theme.border_width = 2

theme.border_normal = clr.border
theme.border_focus = clr.blue

theme.bg_normal = clr.bg_dark
theme.bg_focus = clr.bg_light
theme.bg_urgent = clr.bg_dark
theme.bg_minimize = clr.bg_light

theme.fg_normal = clr.mono_1
theme.fg_focus = "#ffffff"
theme.fg_urgent = clr.red
theme.fg_minimize = clr.mono_4


theme.taglist_font = "Jetbrains Mono Bold 10"
theme.taglist_shape = gears.shape.circle
theme.taglist_bg_focus = clr.transparent
theme.taglist_fg_focus = clr.blue
theme.taglist_fg_empty = clr.mono_3
theme.taglist_fg_occupied = clr.mono_1
theme.taglist_fg_urgent = clr.red
theme.taglist_spacing = 8
theme.taglist_margin = 4

-- Margins

theme.wibar_padding_left = 8
theme.wibar_padding_right = 8
theme.wibar_widget_spacing_left = 16
theme.wibar_widget_spacing_right = 16
theme.layoutbox_margin = 4
theme.systray_margin = 4

-- Spacings

theme.systray_icon_spacing = 8

local wallpaper_dir = "/home/malte/wallpapers/"

-- local wallpapers = {
--     wallpaper_dir .. "leaves-onedark-green.png",
--     wallpaper_dir .. "leaves-onedark.png"
-- }

local wallpapers = {
    theme.path .. "wallpapers/leaves.png",
    theme.path .. "wallpapers/leaves.png"
}

theme.wallpaper = function(s)
    return wallpapers[s.index]
end

theme.drun_config_path = theme.path .. "rofi/drun_config.rasi"
theme.run_config_path = theme.path .. "rofi/run_config.rasi"
theme.window_config_path = theme.path .. "rofi/window_config.rasi"
theme.powermenu_config_path = theme.path .. "rofi/powermenu_config.rasi"
theme.confirmation_config_path = theme.path .. "rofi/confirmation_config.rasi"
theme.lockscreen_image = theme.path .. "wallpapers/leaves-dual-monitor-lock-screen.png"

theme.picom = "picom --experimental-backends --config " .. theme.path .. "picom.conf"

-- You can use your own layout icons like this:
theme.layout_fairh = themes_path.."default/layouts/fairhw.png"
theme.layout_fairv = themes_path.."default/layouts/fairvw.png"
theme.layout_floating  = themes_path.."default/layouts/floatingw.png"
theme.layout_magnifier = themes_path.."default/layouts/magnifierw.png"
theme.layout_max = themes_path.."default/layouts/maxw.png"
theme.layout_fullscreen = themes_path.."default/layouts/fullscreenw.png"
theme.layout_tilebottom = themes_path.."default/layouts/tilebottomw.png"
theme.layout_tileleft   = themes_path.."default/layouts/tileleftw.png"
theme.layout_tile = themes_path.."default/layouts/tilew.png"
theme.layout_tiletop = themes_path.."default/layouts/tiletopw.png"
theme.layout_spiral  = themes_path.."default/layouts/spiralw.png"
theme.layout_dwindle = themes_path.."default/layouts/dwindlew.png"
theme.layout_cornernw = themes_path.."default/layouts/cornernww.png"
theme.layout_cornerne = themes_path.."default/layouts/cornernew.png"
theme.layout_cornersw = themes_path.."default/layouts/cornersww.png"
theme.layout_cornerse = themes_path.."default/layouts/cornersew.png"

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
-- theme.icon_theme = nil

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
