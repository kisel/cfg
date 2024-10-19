
-- https://github.com/mpv-player/mpv/blob/master/TOOLS/lua/ontop-playback.lua
-- makes mpv disable ontop when pausing and re-enable it again when resuming playback

local was_ontop = false

mp.observe_property("pause", "bool", function(_, value)
    local ontop = mp.get_property_native("ontop")
    if value then
        if ontop then
            mp.set_property_native("ontop", false)
            was_ontop = true
        end
    else
        if was_ontop and not ontop then
            mp.set_property_native("ontop", true)
        end
        was_ontop = false
    end
end)


