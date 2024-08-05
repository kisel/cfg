
Import-Module PSReadLine
Set-PSReadlineOption -EditMode Emacs


# Ctrl-D:  ViExit - Exits the shell.
Set-PSReadlineKeyHandler -Key ctrl+d -Function ViExit

# cls
Set-PSReadlineKeyHandler -Key ctrl+l -Function ClearScreen

# Accept Completion with ctrl-y
Set-PSReadlineKeyHandler -Key ctrl+y -Function Complete

# see also
# https://learn.microsoft.com/en-us/powershell/module/psreadline/about/about_psreadline_functions?view=powershell-7.4
# Alt+= - possible completions
#

