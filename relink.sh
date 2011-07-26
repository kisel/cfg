#!/bin/sh

#create links for files

cd ~/.cfg
  
for i in `find . -maxdepth 1 -type f -name ".*"|cut -c 3-`; do
  if [ -e ~/$i ]; then
    diff -w $i ~/$i
    rc=$?
    doIt="y"
    if [ "$rc" != "0" ]; then
      echo "file ~/$i differs. Rewrite?[y/n]" && read doIt
    fi
  else
    doIt="y"
  fi

  if [ "$doIt" = "y" ]; then
    ln -v -f $i ~/$i
  fi
done

