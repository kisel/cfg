print("main.lua loaded")
--
function reload_script()
    print("reload script called")
    local scripts_dir = mp.get_script_directory()
    -- mp.commandv("load-script", scripts_dir .. "/main.lua")
    mp.commandv("load-script", "C:/Users/antonk/AppData/Roaming/mpv/scripts/main.lua")
    mp.commandv("show-text", "reloaded main.lua")
end
mp.add_key_binding("alt+r", "reload_script", reload_script)

--mp.add_key_binding("alt+p", "something", something_handler)

