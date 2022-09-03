
--    ▌ ▌      ▗    ▌  ▜     ▛▀▖   ▗▀▖▗    ▗▐  ▗
--    ▚▗▘▝▀▖▙▀▖▄ ▝▀▖▛▀▖▐ ▞▀▖ ▌ ▌▞▀▖▐  ▄ ▛▀▖▄▜▀ ▄ ▞▀▖▛▀▖▞▀▘
--    ▝▞ ▞▀▌▌  ▐ ▞▀▌▌ ▌▐ ▛▀  ▌ ▌▛▀ ▜▀ ▐ ▌ ▌▐▐ ▖▐ ▌ ▌▌ ▌▝▀▖
--     ▘ ▝▀▘▘  ▀▘▝▀▘▀▀  ▘▝▀▘ ▀▀ ▝▀▘▐  ▀▘▘ ▘▀▘▀ ▀▘▝▀ ▘ ▘▀▀

local beautiful = require("beautiful")
local awful = require("awful")
local gears = require("gears")

local themes = {}
themes.default = gears.filesystem.get_themes_dir() .. "default/theme.lua"
themes.onedark = gears.filesystem.get_configuration_dir() .. "themes/onedark/theme.lua"
themes.minimal = gears.filesystem.get_configuration_dir() .. "themes/minimal/theme.lua"

beautiful.init(themes.onedark)

modkey = "Mod4"
myFocusFollowMouse = false

terminal = "alacritty"
browser = "firefox"
file_manager = "nemo"
email_client = "thunderbird"

editor = os.getenv("EDITOR") or "nvim"
editor_cmd = terminal .. " -e " .. editor

awful.layout.layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.max
}
