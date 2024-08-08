# Remove standard powershell aliases to use real commands from uutils-coreutils 
#
# scoop info uutils-coreutils
#
# scoop install uutils-coreutils
# scoop install grep
#
remove-alias cp -ErrorAction SilentlyContinue
remove-alias mv -ErrorAction SilentlyContinue
remove-alias rm -ErrorAction SilentlyContinue
remove-alias tee -f -ErrorAction SilentlyContinue
remove-alias tail -ErrorAction SilentlyContinue
remove-alias grep -ErrorAction SilentlyContinue

