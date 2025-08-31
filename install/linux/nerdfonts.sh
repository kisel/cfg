#!/bin/sh

mkdir -p .local/share/fonts
cd .local/share/fonts/
curl -L https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Hack.tar.xz | xz -d | tar xv
fc-cache -fv

