
Set-Alias grep Select-String
Set-Alias open Invoke-Item
Set-Alias g git
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

