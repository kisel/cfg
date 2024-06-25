# -- linux aliases
Set-Alias grep Select-String
Set-Alias open Invoke-Item
Set-Alias g git
Set-Alias less more
Set-Alias time Measure-Command
Set-Alias which Get-Command

function .. { cd .. }
function ... { cd ../.. }

function watch($ScriptBlock, $interval=1) { 
  while(1) {
    cls
    Invoke-Command $ScriptBlock
    Sleep $interval
  }
}

Function head($fn) {
	Get-Content -Path $fn -ReadCount 32 | Format-List | more
}

# sane readline settings
Set-PSReadlineKeyHandler -Key ctrl+d -Function ViExit
Set-PSReadlineKeyHandler -Key ctrl+l -Function ClearScreen
Import-Module PSReadLine
Set-PSReadlineOption -EditMode Emacs

# common powershell scripts

# Prints time took to run last command
function time-last {
    $cmd = (Get-History -Count 1)
    $dur = $cmd.Duration
    $totalSec = [math]::floor($dur.TotalSeconds)
    $ms = [math]::floor($dur.Milliseconds)
    Write-Output "rc=$LastExitCode | took $totalSec seconds $ms ms"
}


Set-Alias k kubectl

# Local tweaks
#
$env:EDITOR="vim"

# Import-Module posh-git
# $GitPromptSettings.AnsiConsole = $false
# $GitPromptSettings.EnableFileStatus = $false

Function mcmd {
    # executes a single command withing msys
    & "C:\msys64\msys2_shell.cmd" -here -defterm -mingw64 -no-start -c "$args"
}
Function msys {
    # starts msys bash without windows $PATH
    & "C:\msys64\msys2_shell.cmd" -here -defterm -mingw64 -no-start $args
}

Function msysfp {
    # starts msys bash WITH windows $PATH. may cause conflicts
    & "C:\msys64\msys2_shell.cmd" -here -defterm -mingw64 -no-start -use-full-path $args
}

# from admin pwsh
Function defender-disable {
	Set-MpPreference -DisableRealtimeMonitoring $true
}

# from admin pwsh
Function defender-enable {
	Set-MpPreference -DisableRealtimeMonitoring $false
}

Invoke-Expression (& { (zoxide init powershell | Out-String) })

# https://yazi-rs.github.io/docs/quick-start#shell-wrapper
function yy {
    $tmp = [System.IO.Path]::GetTempFileName()
    yazi $args --cwd-file="$tmp"
    $cwd = Get-Content -Path $tmp
    if (-not [String]::IsNullOrEmpty($cwd) -and $cwd -ne $PWD.Path) {
        Set-Location -LiteralPath $cwd
    }
    Remove-Item -Path $tmp
}

$JUMPLIST="~/.jumplist"
Function jbookmark {
    echo "$PWD" >> $JUMPLIST
}

Function j {
    cd $(Get-Content "$JUMPLIST" | fzf --preview="dir {}")
}


# https://github.com/kelleyma49/PSFzf/tree/master?tab=readme-ov-file#psreadline-integration
# CTRL-T - Paste the selected files and directories onto the command-line
# CTRL-R - Paste the selected command from history onto the command-line
# ALT-C - cd into the selected directory
#
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'
#Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }
#$script:AltCCommand = [ScriptBlock]{
#	param($Location)
#	Set-Location $Location
#}
#Set-PsFzfOption -AltCCommand $script:AltCCommand 


