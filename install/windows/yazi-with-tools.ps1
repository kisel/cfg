scoop install yazi
# Install the optional dependencies (recommended):
scoop install ffmpeg 7zip jq poppler fd ripgrep fzf zoxide imagemagick

# need path to "file" for preview
# https://yazi-rs.github.io/docs/installation/#windows
setx YAZI_FILE_ONE "C:\Program Files\Git\usr\bin\file.exe"

