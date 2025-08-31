#!/bin/sh

# Why not brew.sh? It installs other stuff I don't need
#
set -x -e
if [ "$(uname -m)" != "x86_64" ]; then
    echo "Unsupported platform"
    exit 1
fi

FN=yazi-x86_64-unknown-linux-gnu.zip
VER=v25.5.31
TARGET=/opt/yazi-$VER
sudo mkdir $TARGET
cd $TARGET
sudo wget https://github.com/sxyazi/yazi/releases/download/$VER/$FN
sudo unzip $FN
sudo mv yazi-x86_64-unknown-linux-gnu/* $TARGET
sudo rmdir $TARGET/yazi-x86_64-unknown-linux-gnu
sudo rm $TARGET/$FN
sudo ln -s $TARGET/ya /usr/local/bin/
sudo ln -s $TARGET/yazi /usr/local/bin/

