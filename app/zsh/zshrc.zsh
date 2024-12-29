# ~/.zshrc

# - install ohmyzsh
#
# https://ohmyz.sh/#install
#
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
#
# - source this file ~/.zshrc


# load oh-my-zsh with custom configuration
source ~/.cfg/app/zsh/ohmyzsh-config.zsh
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
source ~/.cfg/app/zsh/af-magic-fork.zsh-theme


source ~/.cfg/app/zsh/ctrl_xe.zsh
source ~/.cfg/app/zsh/histsize.zsh
source ~/.cfg/app/jumplist/jumplist.sh

# disable escaping when pasted to zsh
DISABLE_MAGIC_FUNCTIONS=true

source ~/.cfg/app/bash/use-ssh-agent.sh
source ~/.cfg/app/bash/yazi.sh
source ~/.cfg/app/bash/aliases.sh


