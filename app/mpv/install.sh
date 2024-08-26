#!/bin/sh

mkdir -p ~/.config/mpv
mkdir -p ~/.config/mpv/scripts

ln -vs $PWD/mpv.conf ~/.config/mpv/mpv.conf
ln -vs $PWD/scripts/pip.lua ~/.config/mpv/scripts/pip.lua

cd ~/.config/mpv
curl -Lo /tmp/uosc.zip https://github.com/tomasklaen/uosc/releases/download/5.2.0/uosc.zip
unzip /tmp/uosc.zip
rm -f /tmp/uosc.zip

