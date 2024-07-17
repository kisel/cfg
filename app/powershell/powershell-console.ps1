
Import-Module PSReadLine
Set-PSReadlineOption -EditMode Emacs

Set-PSReadlineKeyHandler -Key ctrl+d -Function ViExit
Set-PSReadlineKeyHandler -Key ctrl+l -Function ClearScreen

