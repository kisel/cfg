#/bin/sh
set -x
mkdir -p $HOME/.config/fish/conf.d/
rm $HOME/.config/fish/conf.d/cfg.fish
ln -s $HOME/.cfg/app/fish/cfg.fish $HOME/.config/fish/conf.d/cfg.fish

