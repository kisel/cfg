# X11 server for ssh X11 forwarding. XLaunch
choco install -y vcxsrv

# Need this env var as well
setx DISPLAY 127.0.0.1:0.0

