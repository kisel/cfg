local no_fullscreen = true
local rule = { class = "Chromium" }
client.disconnect_signal("request::geometry", awful.ewmh.geometry)
client.connect_signal("request::geometry", function(c, context, ...)
    if not no_fullscreen or context ~= "fullscreen" or not awful.rules.match(c, rule) then
        awful.ewmh.geometry(c, context, ...)
    end
end)

