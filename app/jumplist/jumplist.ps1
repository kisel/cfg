# simple bookmarks with FZF

# jbookmark - bookmarks a directory
# j - changes to directory with fzf(https://github.com/junegunn/fzf)

$JUMPLIST="~/.jumplist"
Function jbookmark {
	echo "$PWD" >> $JUMPLIST
}

Function j {
	cd $(Get-Content $JUMPLIST | fzf --preview="dir {}")
}
