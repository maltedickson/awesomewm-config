
--    ▌ ▌       ▛▀▖▗      ▌▗
--    ▙▞ ▞▀▖▌ ▌ ▙▄▘▄ ▛▀▖▞▀▌▄ ▛▀▖▞▀▌▞▀▘
--    ▌▝▖▛▀ ▚▄▌ ▌ ▌▐ ▌ ▌▌ ▌▐ ▌ ▌▚▄▌▝▀▖
--    ▘ ▘▝▀▘▗▄▘ ▀▀ ▀▘▘ ▘▝▀▘▀▘▘ ▘▗▄▘▀▀

local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")
local hotkeys_popup = require("awful.hotkeys_popup")

globalkeys = gears.table.join(
    awful.key({ modkey, }, "s", hotkeys_popup.show_help,
        { description="show help", group="awesome" }),

    awful.key({ modkey, }, "Left", awful.tag.viewprev,
        { description = "view previous", group = "tag" }),

    awful.key({ modkey, }, "Right", awful.tag.viewnext,
        {description = "view next", group = "tag"}),

    awful.key({ modkey, }, "j", function () awful.client.focus.byidx(1) end,
        {description = "focus next by index", group = "client"}),

    awful.key({ modkey, }, "k", function () awful.client.focus.byidx(-1) end,
        {description = "focus previous by index", group = "client"}),

    awful.key({ modkey, "Shift" }, "j", function () awful.client.swap.byidx(1) end,
        {description = "swap with next client by index", group = "client"}),

    awful.key({ modkey, "Shift" }, "k", function () awful.client.swap.byidx(-1) end,
        {description = "swap with previous client by index", group = "client"}),

    awful.key({ modkey, }, "u", awful.client.urgent.jumpto,
        {description = "jump to urgent client", group = "client"}),

    awful.key({ modkey, }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "go back", group = "client"}),

    awful.key({ modkey, }, "Return", function () awful.spawn(terminal) end,
        {description = "open terminal", group = "launcher"}),

    awful.key({ modkey, }, "b", function () awful.spawn(browser) end,
        {description = "open web browser", group = "launcher"}),

    awful.key({ modkey, }, "f", function () awful.spawn(file_manager) end,
        {description = "open file manager", group = "launcher"}),

    awful.key({ modkey, }, "e", function () awful.spawn(email_client) end,
        {description = "open email client", group = "launcher"}),

    awful.key({ modkey, }, "d", function ()
            local config = ""
            if beautiful.drun_config_path then
                config = " -config " .. beautiful.drun_config_path
            end
            awful.spawn("rofi -show drun -modi drun" .. config)
        end,
        {description = "drun", group = "rofi"}),

    awful.key({ modkey, }, "r", function ()
            local config = ""
            if beautiful.run_config_path then
                config = " -config " .. beautiful.run_config_path
            end
            awful.spawn("rofi -show run -modi run" .. config)
        end,
        {description = "run", group = "rofi"}),

    awful.key({ modkey, }, "w", function ()
            local config = ""
            if beautiful.window_config_path then
                config = " -config " .. beautiful.window_config_path
            end
            awful.spawn("rofi -show window -modi window" .. config)
        end,
        {description = "window switcher", group = "rofi"}),

    awful.key({ modkey, }, "c", function ()
            local config = ""
            if beautiful.calc_config_path then
                config = " -config " .. beautiful.calc_config_path
            end
            awful.spawn("rofi -show calc -modi calc -no-show-match -no-sort" .. config)
        end,
        {description = "calc", group = "rofi"}),

    awful.key({ modkey, }, "q", function ()
            local powermenu_config = ""
            if beautiful.powermenu_config_path then
                powermenu_config = " -p " .. beautiful.powermenu_config_path
            end

            local confirmation_config = ""
            if beautiful.confirmation_config_path then
                confirmation_config = " -c " .. beautiful.confirmation_config_path
            end

            local lockscreen_image = ""
            if beautiful.lockscreen_image then
                lockscreen_image = " -i " .. beautiful.lockscreen_image
            end
            local output = "/home/malte/.config/awesome/powermenu" .. powermenu_config .. confirmation_config .. lockscreen_image
            awful.spawn(output)
            -- powermenu -c /path/to/config -i /path/to/image
        end,
        {description = "power menu", group = "rofi"}),

    awful.key({ modkey, "Control" }, "r", awesome.restart,
        {description = "reload awesome", group = "awesome"}),

    awful.key({ modkey, "Shift" }, "q", awesome.quit,
        {description = "quit awesome", group = "awesome"}),

    awful.key({ modkey, }, "l", function () awful.tag.incmwfact( 0.05) end,
        {description = "increase master width factor", group = "layout"}),

    awful.key({ modkey, }, "h", function () awful.tag.incmwfact(-0.05) end,
        {description = "decrease master width factor", group = "layout"}),

    awful.key({ modkey, "Shift" }, "h", function () awful.tag.incnmaster( 1, nil, true) end,
        {description = "increase the number of master clients", group = "layout"}),

    awful.key({ modkey, "Shift" }, "l", function () awful.tag.incnmaster(-1, nil, true) end,
        {description = "decrease the number of master clients", group = "layout"}),

    awful.key({ modkey, "Control" }, "h", function () awful.tag.incncol( 1, nil, true) end,
        {description = "increase the number of columns", group = "layout"}),

    awful.key({ modkey, "Control" }, "l", function () awful.tag.incncol(-1, nil, true) end,
        {description = "decrease the number of columns", group = "layout"}),

    awful.key({ modkey, }, "space", function () awful.layout.inc(1) end,
        {description = "select next", group = "layout"}),

    awful.key({ modkey, "Shift" }, "space", function () awful.layout.inc(-1) end,
        {description = "select previous", group = "layout"}),

    -- awful.key({ modkey }, "r", function () awful.screen.focused().mypromptbox:run() end,
    --     {description = "run prompt", group = "launcher"}),

    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end,
        {description = "focus the next screen", group = "screen"}),

    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
        {description = "focus the previous screen", group = "screen"})
)

clientkeys = gears.table.join(
    awful.key({ modkey, "Shift" }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "toggle fullscreen", group = "client"}),

    awful.key({ modkey, "Shift" }, "c", function (c) c:kill() end,
        {description = "close", group = "client"}),

    awful.key({ modkey, "Control" }, "space", awful.client.floating.toggle                     ,
        {description = "toggle floating", group = "client"}),

    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
        {description = "move to master", group = "client"}),

    awful.key({ modkey, }, "o", function (c) c:move_to_screen() end,
        {description = "move to screen", group = "client"}),

    awful.key({ modkey, }, "t", function (c) c.ontop = not c.ontop end,
        {description = "toggle keep on top", group = "client"})
)

for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  {description = "view tag #"..i, group = "tag"}),
        -- Toggle tag display.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end,
                  {description = "toggle tag #" .. i, group = "tag"}),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  {description = "move focused client to tag #"..i, group = "tag"}),
        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:toggle_tag(tag)
                          end
                      end
                  end,
                  {description = "toggle focused client on tag #" .. i, group = "tag"})
    )
end

clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ modkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)

-- Set keys
root.keys(globalkeys)
