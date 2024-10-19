# install mpv with choco
choco install -y mpv

# install uosc GUI
irm https://raw.githubusercontent.com/tomasklaen/uosc/HEAD/installers/windows.ps1 | iex

$MPV_CFG="$env:APPDATA/mpv"
# config uosc
# fix annoying timeline on a small window
sed -i 's/progress=windowed/progress=never/' $MPV_CFG/script-opts/uosc.conf
# hide speed control
sed -i 's/,speed,/,/' $MPV_CFG/script-opts/uosc.conf

# thumbnails for mpv
# https://github.com/po5/thumbfast
curl -Lo $HOME/AppData/Roaming/mpv/scripts/cfg/thumbfast.lua https://raw.githubusercontent.com/po5/thumbfast/refs/heads/master/thumbfast.lua

# link config
ln -v -s $HOME/.cfg/app/mpv/scripts $HOME/AppData/Roaming/mpv/scripts/cfg

