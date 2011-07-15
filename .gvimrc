source $HOME/.cfg/vimrc.vim

if has("unix")
  set nobackup

else
  set lines=99999 columns=99999
  set guifont=Consolas:h11:cDEFAULT
  set backup
  set backupdir=$TEMP
endif 

set guioptions-=T "Toolbar

