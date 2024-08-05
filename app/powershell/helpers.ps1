# Set some aliases I use

function mkdircd {
    mkdir -p $args[0] -ErrorAction SilentlyContinue
    cd $args[0]
}

Set-Alias lg    lazygit   
Set-Alias ls    eza      
Set-Alias gui   gitui    
Set-Alias g     git      
Set-Alias k     kubectl 
Set-Alias v     nvim

function l     { eza --color=auto --icons=auto $args }

