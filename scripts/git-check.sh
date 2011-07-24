#!/bin/sh

has_win_includes=$(git grep '#include \"\.\.\\\\' 2>/dev/null)
if [ "" != "$has_win_includes" ]; then
  echo "Incorrect includes founded:"
  git grep '#include \"\.\.\\\\'
  exit 1
fi

[ -n "`git diff --cached -- **.vcproj |grep Version=`" ] && echo "Vcproj version violated" && exit 1
[ -n "`git diff -- **.vcproj |grep Version=`" ] && echo "Vcproj version violated" && exit 1

exit 0