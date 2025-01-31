-- https://mpv.io/manual/master/#lua-scripting

-- ./ontop.lua
require('ontop')
-- print('loading config')

mp.set_property("border", "no")
mp.set_property("osd-bar", "no")

-- fullscreen on start
mp.set_property("fs", "yes")

-- do not close mpv on playlist end
mp.set_property("keep-open", "yes")

-- audio priority
mp.set_property("alang", "en,en-US,ru")
-- mp.set_property("slang", "en,en-US,ru")

-- keybinds
mp.add_key_binding("h", "keybinds", function()
    mp.command('script-binding uosc/keybinds')
end)

--mp.add_key_binding("Ctrl+o", "open-file", function()
--    mp.command('script-binding uosc/open-file')
--end)
mp.add_key_binding("Alt+o", "open-file", function()
    mp.command('script-binding uosc/open-file')
end)

mp.add_key_binding("Ctrl+s", "stream-quality", function()
    mp.command('script-binding uosc/stream-quality')
end)

mp.add_key_binding("Ctrl+Alt+d", "delete-file-next", function()
    mp.command('script-binding uosc/delete-file-next')
end)

