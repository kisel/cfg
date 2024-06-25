# git clone https://github.com/kisel/cfg/ $HOME/.cfg

.  $HOME/.cfg/app/jumplist/jumplist.ps1
.  $HOME/.cfg/app/powershell/powershell-console.ps1 
.  $HOME/.cfg/app/powershell/linux-aliases.ps1
.  $HOME/.cfg/app/powershell/win-system.ps1
.  $HOME/.cfg/app/powershell/msys.ps1
.  $HOME/.cfg/app/powershell/yazi.ps1
.  $HOME/.cfg/app/powershell/fd-fzf.ps1

Set-PSReadlineOption -EditMode Emacs
Set-Alias g git
Set-Alias k kubectl
$env:EDITOR="vim"

# Import-Module posh-git
# $GitPromptSettings.AnsiConsole = $false
# $GitPromptSettings.EnableFileStatus = $false



Invoke-Expression (& { (zoxide init powershell | Out-String) })

