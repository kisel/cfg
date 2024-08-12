# Remove standard powershell aliases to use real commands from uutils-coreutils 
#
# scoop info uutils-coreutils
#
# scoop install uutils-coreutils
# scoop install grep
# busybox-lean is a single busybox binary, to not conflict with coreutils
# scoop install busybox-lean
#
remove-alias cp -ErrorAction SilentlyContinue
remove-alias mv -ErrorAction SilentlyContinue
remove-alias rm -ErrorAction SilentlyContinue
remove-alias tee -f -ErrorAction SilentlyContinue
remove-alias tail -ErrorAction SilentlyContinue
remove-alias grep -ErrorAction SilentlyContinue
remove-alias sleep -Force -ErrorAction SilentlyContinue

