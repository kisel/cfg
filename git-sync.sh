#!/bin/sh

# Send shortcut from non-usual dev env

echo 'update' > .git/COMMIT_EDITMSG
git ls-files -m | head -n 5 >> .git/COMMIT_EDITMSG

git commit -a --edit -F .git/COMMIT_EDITMSG
git pull --rebase
git log origin...
echo "Send?"
read x
git push git@github.com:kisel/cfg.git


