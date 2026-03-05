# config.nu
# See https://www.nushell.sh/book/configuration.html
#
# You can also pretty-print and page through the documentation for configuration
# options using:
#     config nu --doc | nu-highlight | less -R


# COPY this to config nu or source
# source ~/.cfg/app/nushell/config.nu

$env.config.show_banner = false
$env.config.buffer_editor = "nvim"

source ~/.cfg/app/nushell/yazi.nu
source ~/.cfg/app/nushell/zoxide.nu
source ~/.cfg/app/nushell/alias.nu
source ~/.cfg/app/nushell/carapace.nu

use ~/.cfg/app/nushell/completions/git-completions.nu *
use ~/.cfg/app/nushell/completions/scoop-completions.nu *
use ~/.cfg/app/nushell/completions/ssh-completions.nu *




