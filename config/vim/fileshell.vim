function! ShellFile()
  :w
  if &filetype=="python"
    :!python %
  elseif &filetype=="perl"
    :!perl %
  elseif &filetype=="vb"
    :!wscript %
  elseif &filetype=="sh"
    :!sh %
  elseif &filetype=="dosbatch"
    :!cmd /c %
  elseif &filetype=="vim"
    :so %
  else
    echo "Nothing to launch"
  endif
endfunction




