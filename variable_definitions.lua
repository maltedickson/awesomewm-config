
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

beautiful.init(themes.onedark)

modkey = "Mod4"
myFocusFollowMouse = false

terminal = "alacritty"
browser = "brave-browser-stable"
file_manager = "pcmanfm"
email_client = "thunderbird"

editor = os.getenv("EDITOR") or "nvim"
editor_cmd = terminal .. " -e " .. editor

awful.layout.layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.max
}
