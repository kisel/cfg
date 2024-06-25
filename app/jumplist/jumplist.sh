#!/bin/sh

# simple bookmarks with FZF(https://github.com/junegunn/fzf)

# jbookmark - bookmarks a directory
# j - changes to directory with fzf

JUMPLIST=$HOME/.jumplist.lst

jbookmark() {
    touch $JUMPLIST
    if ! grep "$PWD" "$JUMPLIST" ; then
        echo "$PWD" >> $JUMPLIST
    fi
    echo "Added $PWD to $JUMPLIST"
}

j() {
    cd $(cat $JUMPLIST | fzf --preview='ls -al {}')
}
