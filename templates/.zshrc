# ~/.zshrc

source ~/.cfg/app/zsh/zshrc.zsh

eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

alias g=git
alias k=kubectl
alias v=nvim
alias l=eza
alias ll=eza -l


