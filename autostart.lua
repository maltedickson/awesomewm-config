
--    ▞▀▖   ▐        ▐        ▐  
--    ▙▄▌▌ ▌▜▀ ▞▀▖▞▀▘▜▀ ▝▀▖▙▀▖▜▀ 
--    ▌ ▌▌ ▌▐ ▖▌ ▌▝▀▖▐ ▖▞▀▌▌  ▐ ▖
--    ▘ ▘▝▀▘ ▀ ▝▀ ▀▀  ▀ ▝▀▘▘   ▀ 

local awful = require("awful")
local beautiful = require("beautiful")

awful.spawn.once("xrandr --output HDMI-0 --primary --right-of DVI-D-0")
awful.spawn.once("setxkbmap -layout us,se -option grp:alt_shift_toggle")


if beautiful.picom then
    awful.spawn(beautiful.picom)
else
    awful.spawn("killall picom")
end
