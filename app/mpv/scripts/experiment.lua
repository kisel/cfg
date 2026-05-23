--makes mpv disable ontop when pausing and re-enable it again when resuming playback
--please note that this won't do anything if ontop was not enabled before pausing

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

function something_handler()
    -- WxHxXxY
    -- local geometry = "800x600+10+400"
    -- print("Set geometry: " .. geometry)
    -- mp.set_property("geometry", geometry)
    -- mp.set_geometry(800, 600, 50, 50)
    --
    -- Function to get a property and write it to a file
    local function get_and_write(prop_name, file)
      local value = mp.get_property(prop_name)
      if value then
        file:write(prop_name .. ": " .. value .. "\n")
      end
    end

    -- Open the output file
    local output_file = io.open("mpv_properties.txt", "wa")
    output_file:write("hello \n")

    -- Get a list of available properties (not all might be writable)
    local properties = mp.get_property_list()

    -- Loop through properties and write them to the file
    for _, prop in ipairs(properties) do
      get_and_write(prop, output_file)
    end

    -- Close the output file
    output_file:close()

    mp.command("show-text", "Properties written to mpv_properties.txt")
    mp.command("load-script", "Properties written to mpv_properties.txt")
    print("Properties written to mpv_properties.txt")


end

function reload_script()
    print("reload script called")
    mp.commandv("load-script", "~/AppData/Roaming/mpv/scripts/main.lua")
    mp.commandv("show-text", "reloaded main.lua")
end
mp.add_key_binding("alt+p", "something", something_handler)
mp.add_key_binding("alt+r", "reload_script", reload_script)

