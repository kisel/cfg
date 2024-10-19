
APP: https://github.com/mpv-player/mpv
UI: https://github.com/tomasklaen/uosc

### Config dir

Windows: $env:APPDATA/mpv
Windows: $APPDATA/mpv
Linux:   ~/.config/mpv


### Install on Windows

see [./install.ps1](./install.ps1)



### Configuration
- mpv.conf   -- properties
- input.conf -- keybindings
- *.lua    -- scripts
- <name>/*.lua    -- script dir with main.lua

###  Scripting eval
```
` - backtick - eval console
set boder no
print-text ${propertyname}
```

