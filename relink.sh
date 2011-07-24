#!/bin/sh

#create links for files

cd ~/.cfg
  
for i in `find . -type f -level 0 -name ".*"|cut -c 3-`; do
  echo diff $i ~/$i
  diff $i ~/$i
  rc=$?

  if [ "$rc" != "0" ]; then
    echo "Rewrite?[y/n]" && read ans && [ "$ans" = "y" ] && ln -v -f $i ~/$i
  fi
done

