
--    ▌ ▌   ▜▜                
--    ▌▖▌▝▀▖▐▐ ▛▀▖▝▀▖▛▀▖▞▀▖▙▀▖
--    ▙▚▌▞▀▌▐▐ ▙▄▘▞▀▌▙▄▘▛▀ ▌  
--    ▘ ▘▝▀▘ ▘▘▌  ▝▀▘▌  ▝▀▘▘  

local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")

awful.screen.connect_for_each_screen(function(s)
        if beautiful.wallpaper then
            local wallpaper = beautiful.wallpaper
            -- If wallpaper is a function, call it with the screen
            if type(wallpaper) == "function" then
                wallpaper = wallpaper(s)
            end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end)