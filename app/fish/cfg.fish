# linked config from ~/.cfg/app/fish
# linked to $HOME/.config/fish/conf.d
abbr -a g git
abbr -a k kubectl
abbr -a v nvim
abbr -a neo neovide
abbr -a lg lazygit
#abbr -a ls eza
abbr -a l eza
abbr -a ll eza -al
abbr -a gui gitui
abbr -a y yazi

if not set -q EDITOR
    if type -q nvim
        set -gx EDITOR nvim
    else if type -q vim
        set -gx EDITOR vim
    else
        set -gx EDITOR vi
    end
end

abbr -a v $EDITOR

# stop shortening directories. unless path is too long
set -g fish_prompt_pwd_dir_length 10

# https://yazi-rs.github.io/docs/quick-start/
function yazi
    set -l tmp (mktemp -t "yazi-cwd.XXXXXX")
    command yazi $argv --cwd-file=$tmp
    set -l cwd (cat $tmp)
    if test -n "$cwd" -a -d "$cwd"
        cd $cwd
    end
    rm -f $tmp
end

function mkdircd
    mkdir -p $argv[1]
    cd $argv[1]
end

function ssha
    ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null $argv
end

function time-last
    echo "rc=$status | took $CMD_DURATION seconds"
end

function ts
    date "+%Y-%m-%d %H:%M:%S"
end

# --- Zoxide
set -l zoxide_cfg ~/.config/fish/conf.d/zoxide.fish

if not test -f $zoxide_cfg
    if type -q zoxide
        zoxide init fish > $zoxide_cfg
        source $zoxide_cfg
    end
end


