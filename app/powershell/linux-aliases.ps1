# pretend it's a bash shell

Set-Alias grep Select-String
Set-Alias open Invoke-Item
Set-Alias less more
Set-Alias time Measure-Command
function .. { cd .. }
function ... { cd ../.. }

Function head($fn) {
        Get-Content -Path $fn -ReadCount 32 | Format-List | more
}

Function defender-disable {
        Set-MpPreference -DisableRealtimeMonitoring $true
}

Function defender-enable {
        Set-MpPreference -DisableRealtimeMonitoring $false
}

# common powershell scripts

# Prints time took to run last command
function time-last {
    $cmd = (Get-History -Count 1)
    $dur = $cmd.Duration
    $totalSec = [math]::floor($dur.TotalSeconds)
    $ms = [math]::floor($dur.Milliseconds)
    Write-Output "rc=$LastExitCode | took $totalSec seconds $ms ms"
}

