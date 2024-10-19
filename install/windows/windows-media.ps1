# These should not be installed with scoop
# as I want "Open with" and file association to work properly
choco install -y mpv
choco install -y vlc


# install GUI for mpv
# https://github.com/tomasklaen/uosc
irm https://raw.githubusercontent.com/tomasklaen/uosc/HEAD/installers/windows.ps1 | iex

