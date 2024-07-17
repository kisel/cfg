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

Function jbookmark-remove-deleted {
    $fileList = Get-Content -Path $JUMPLIST
    $validFiles = @()

    foreach ($filePath in $fileList) {
        if (Test-Path ($filePath.Trim())) {
            $validFiles += $filePath.Trim()
        } else {
            Write-Warning "removed outdated entity '$filePath'"
        }
        $validFiles | Out-File -FilePath "$JUMPLIST.new" -Append -NoClobber
        Move-Item -Force $JUMPLIST "$JUMPLIST.bak"
        Move-Item -Force "$JUMPLIST.new" $JUMPLIST
    }
}

