-- https://mpv.io/manual/master/#lua-scripting

-- ./ontop.lua
require('ontop')
-- print('loading config')

mp.set_property("border", "no")
mp.set_property("osd-bar", "no")

-- audio priority
mp.set_property("alang", "en,en-US,ru")
-- mp.set_property("slang", "en,en-US,ru")

-- show keybinds
mp.add_key_binding("h", "keybinds", function()
    mp.command('script-binding uosc/keybinds')
end)

-- delete file
-- mp.add_key_binding("Alt+d", "delete_file", function()
--     mp.command('script-binding uosc/delete-file-next')
-- end)

