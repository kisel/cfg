## Executes a single command within msys
#def msyscmd [...args: string] {
#    let cmd_str = ($args | str join " ")
#    ^"C:/msys64/msys2_shell.cmd" -here -defterm -mingw64 -no-start -c $cmd_str
#}
#
## Starts msys bash without windows $PATH
#def msys [...args: string] {
#    ^"C:/msys64/msys2_shell.cmd" -here -defterm -mingw64 -no-start $args
#}
#
## Starts msys bash WITH windows $PATH. may cause conflicts
#def msysfp [...args: string] {
#    ^"C:/msys64/msys2_shell.cmd" -here -defterm -mingw64 -no-start -use-full-path $args
#}
#
## Alias for msyscmd
#alias mcmd = msyscmd

alias msys = ^C:/msys64/msys2_shell.cmd -here -defterm -mingw64 -no-start

