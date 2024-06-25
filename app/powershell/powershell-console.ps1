
Set-PSReadlineKeyHandler -Key ctrl+d -Function ViExit
Set-PSReadlineKeyHandler -Key ctrl+l -Function ClearScreen
Import-Module PSReadLine
Set-PSReadlineOption -EditMode Emacs

# https://github.com/kelleyma49/PSFzf/tree/master?tab=readme-ov-file#psreadline-integration
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'
Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }
