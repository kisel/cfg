Function msyscmd {
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

Set-Alias mcmd msyscmd

