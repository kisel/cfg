# https://github.com/kelleyma49/PSFzf/tree/master?tab=readme-ov-file#psreadline-integration
# CTRL-T - Paste the selected files and directories onto the command-line
# CTRL-R - Paste the selected command from history onto the command-line
# ALT-C - cd into the selected directory
#
# https://github.com/kelleyma49/PSFzf/tree/master?tab=readme-ov-file#psreadline-integration

Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'
Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }

#Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }
#$script:AltCCommand = [ScriptBlock]{
#	param($Location)
#	Set-Location $Location
#}
#Set-PsFzfOption -AltCCommand $script:AltCCommand 


