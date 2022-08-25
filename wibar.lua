
--    ▌ ▌▗ ▌        
--    ▌▖▌▄ ▛▀▖▝▀▖▙▀▖
--    ▙▚▌▐ ▌ ▌▞▀▌▌  
--    ▘ ▘▀▘▀▀ ▝▀▘▘  

local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
    awful.button({ }, 1, function(t) t:view_only() end),

    awful.button({ modkey }, 1, function(t)
        if client.focus then
            client.focus:move_to_tag(t)
        end
    end),

    awful.button({ }, 3, awful.tag.viewtoggle),

    awful.button({ modkey }, 3, function(t)
        if client.focus then
            client.focus:toggle_tag(t)
        end
    end),

    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),

    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
)

awful.screen.connect_for_each_screen(function(s)
    -- Each screen has its own tag table.
    awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])

    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        -- filter = awful.widget.taglist.filter.noempty,
        buttons = taglist_buttons
    }

    s.mytextclock = wibox.widget.textclock("%R")

    -- s.mytextdate = wibox.widget.textclock("%a %b %e") -- Fri Aug 19
    s.mytextdate = wibox.widget.textclock("%F") -- 2022-08-19

    s.month_calendar = awful.widget.calendar_popup.month({ screen = s, week_numbers = true})
    s.month_calendar:attach( s.mytextdate, "tr", {on_hover = false} )

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        expand = "outside",
        {
            widget = wibox.container.place,
            halign = "left",
            {
                widget = wibox.container.margin,
                left = beautiful.wibar_padding_left,
                {
                    layout = wibox.layout.fixed.horizontal,
                    spacing = beautiful.wibar_widget_spacing_left,
                    -- Left Widgets
                    {
                        widget = wibox.container.margin,
                        top = beautiful.layoutbox_margin,
                        bottom = beautiful.layoutbox_margin,
                        s.mylayoutbox,
                    }
                }
            }
        },
        {
            layout = wibox.layout.fixed.horizontal,
            -- Center widgets
            {
                widget = wibox.container.margin,
                top = beautiful.taglist_margin,
                bottom = beautiful.taglist_margin,
                s.mytaglist
            },
        },
        {
            widget = wibox.container.place,
            halign = "right",
            {
                widget = wibox.container.margin,
                right = beautiful.wibar_padding_right,
                {
                    layout = wibox.layout.fixed.horizontal,
                    spacing = beautiful.wibar_widget_spacing_right,
                    -- Right widgets
                    {
                        widget = wibox.container.margin,
                        top = beautiful.systray_margin,
                        bottom = beautiful.systray_margin,
                        wibox.widget.systray()
                    },
                    mykeyboardlayout,
                    s.mytextdate,
                    s.mytextclock
                }
            }
        },
    }
end)
