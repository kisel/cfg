#!/bin/sh

#create links for files
BASE=`pwd`
cd $BASE

MODE=$1

if [ -z "$MODE" ]; then
  MODE="--update"
fi

if [ "$MODE" = "-h" ]; then
  echo "$0 --import : import get configs from home directory"
  exit
fi
  
write_cfg() {
  FN=$i
  if [ "$MODE" = "--import" ]; then
    OLD=$FN
    NEW=~/$FN
  else
    OLD=~/$FN
    NEW=$FN
  fi 

  if [ -e $OLD ]; then
    diff -cw $OLD $NEW
    rc=$?
    doIt="y"
    if [ "$rc" != "0" ]; then
      echo "file ~/$FN differs. Rewrite?[y/n]" && read doIt
    fi
  else
    doIt="y"
  fi

  if [ "$doIt" = "y" ]; then
    ln -v -f $NEW $OLD
  fi
}

FILES="`find . -maxdepth 1 -type f -name ".*"|cut -c 3-`"
echo "-- $FILES --"

for i in $FILES; do
  write_cfg $i
done

