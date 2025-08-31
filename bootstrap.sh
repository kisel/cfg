#!/bin/sh

#cat $HOME/.cfg/install/linux/bootstrap.sh
SELF="$HOME/.cfg/install/linux/bootstrap.sh"

separate() {
        echo "====================================="
}

ask() {
    local question="$1"
    local answer

    echo

    while true; do
        echo -n ">>> $question (y/n): "
        read -n 1 -s answer
        echo ""
        echo ""

        # Check the user's input
        if [[ "$answer" == "y" ]]; then
            return 0 # Return 0 for 'yes'
        elif [[ "$answer" == "n" ]]; then
            return 1 # Return 1 for 'no'
        else
            # If the input is neither 'y' nor 'n', inform the user and loop again
            echo "Invalid input: '$answer'. Please enter 'y' or 'n'."
        fi
    done
}

append_if_not_found() {
    local file_path="$1"
    local line_to_append="$2"
    local line_to_grep="${3:-$2}"

    if [[ ! -f "$file_path" ]]; then
        echo "$line_to_append" >> $file_path
        return
    fi

    if grep -qF "$line_to_append" "$file_path" >/dev/null; then
        return
    else
        echo "$line_to_append" >> "$file_path"
    fi
}

if ! test -d $HOME/.cfg ; then
awk '/SECTION_whw/{flag=1; next} flag; /^$/{flag=0}' $SELF
if ask "Clone/update .cfg?" ; then
    git clone https://github.com/kisel/cfg.git ~/.cfg
    cd $HOME/.cfg
    git remote set-url --push origin git@github.com:kisel/cfg.git
    git pull
fi
fi

awk -n '/SECTION_kev/{flag=1; next} flag; /^$/{flag=0}' $SELF
if ask "Initialize sh,zsh,vim with portable configs" ; then
    append_if_not_found ~/.vimrc 'source $HOME/.cfg/app/vim/common.vim'
    cp -v --update=none ~/.cfg/dotfiles/.dircolors ~/.dircolors
    cp -v --update=none -s ~/.cfg/dotfiles/.gitconfig ~/.gitconfig
    echo ". $HOME/.cfg/app/bash/aliases.sh" >> $HOME/.bash_profile
fi

awk -n '/SECTION_qghhe/{flag=1; next} flag; /^$/{flag=0}' $SELF
if ask "Install safe profile tweaks to root user?" ; then
    cat $HOME/.cfg/app/vim/common.vim | sudo tee /root/.vimrc >/dev/null
fi

if ! test -f $HOME/.ssh/authorized_keys ; then
awk -n '/SECTION_khmkl/{flag=1; next} flag; /^$/{flag=0}' $SELF
if ask "Install authorized_keys ? They are missing" ; then
    bash $HOME/.cfg/install/linux/add-ssh-authorized-keys.sh
fi
fi


if grep Ubuntu /etc/*lsb-release >/dev/null ; then
awk '/SECTION_whknb/{flag=1; next} flag; /^$/{flag=0}' $SELF
if ask "Init fresh ubuntu system?" ; then
    sudo apt update
    sudo apt install -y vim tmux
    sudo update-alternatives --set editor /usr/bin/vim.basic
    sh $HOME/.cfg/install/linux/add-ssh-authorized-keys.sh
fi
fi



#vim:sw=4:ts=4:et
