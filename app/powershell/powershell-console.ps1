
# takes ~50ms.
# Import-Module PSReadLine

# standard readline behavior instead of windows
Set-PSReadlineOption -EditMode Emacs


# Ctrl-D:  ViExit - Exits the shell.
Set-PSReadlineKeyHandler -Key ctrl+d -Function ViExit

# cls
Set-PSReadlineKeyHandler -Key ctrl+l -Function ClearScreen

# Accept Completion with ctrl-y
Set-PSReadlineKeyHandler -Key ctrl+y -Function Complete

# Disable bell sound
Set-PSReadlineOption -BellStyle None

# see also
# https://learn.microsoft.com/en-us/powershell/module/psreadline/about/about_psreadline_functions?view=powershell-7.4
# Alt+= - possible completions
#
#
# zsh-style cd
function .. { cd .. }
function ... { cd ../.. }
function .... { cd ../../.. }


# https://github.com/kelleyma49/PSFzf/tree/master?tab=readme-ov-file#psreadline-integration
# CTRL-T - Paste the selected files and directories onto the command-line
# CTRL-R - Paste the selected command from history onto the command-line
# ALT-C - cd into the selected directory
#
# https://github.com/kelleyma49/PSFzf/tree/master?tab=readme-ov-file#psreadline-integration

Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'

#Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }
#$script:AltCCommand = [ScriptBlock]{
#	param($Location)
#	Set-Location $Location
#}
#Set-PsFzfOption -AltCCommand $script:AltCCommand 

# modified https://github.com/kelleyma49/PSFzf/blob/master/PSFzf.TabExpansion.ps1
# to replace \ with / after completion is done
function Invoke-FzfTabCompletionFixSlash() {
    Invoke-FzfTabCompletion
    FixSlash
}

# Convert slash to normal Linux
function FixSlash() {
    $line = $null
    $cursor = $null
    [Microsoft.PowerShell.PSConsoleReadline]::GetBufferState([ref]$line, [ref]$cursor)
    $line = $line.Replace("\", "/")
    [Microsoft.PowerShell.PSConsoleReadline]::Replace(0, $line.Length, $line)
}

function LazyLoadCompletion() {
    # use tab-completion, but not a slow prompt with status
    $env:POSHGIT_CYGWIN_WARNING = 'off'
    Import-Module posh-git
    # $GitPromptSettings.AnsiConsole = $false
    $GitPromptSettings.EnableFileStatus = $false
}

function TabCompleteAndFixSlash() {
    LazyLoadCompletion
    [Microsoft.PowerShell.PSConsoleReadLine]::Complete()
    FixSlash
}

# following functoin actually do completion
#[Microsoft.PowerShell.PSConsoleReadLine]::MenuComplete
#[Microsoft.PowerShell.PSConsoleReadLine]::Complete
#[Microsoft.PowerShell.PSConsoleReadline]::GetBufferState([ref]$line, [ref]$cursor)

# Get-PSReadLineKeyHandler

Set-PSReadLineKeyHandler -Key Shift-Tab -ScriptBlock { Invoke-FzfTabCompletionFixSlash }
Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { TabCompleteAndFixSlash }
# seems Emacs mode breaks MenuComplete
Set-PSReadLineKeyHandler -Key Ctrl-Spacebar -ScriptBlock { [Microsoft.PowerShell.PSConsoleReadLine]::MenuComplete }

Set-PSReadLineKeyHandler -Key Alt-/ -ScriptBlock { FixSlash }

