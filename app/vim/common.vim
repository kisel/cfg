set nocompatible
set background=dark

" allow switching buffers on modified files
set hidden

syntax on
filetype on
filetype indent on
filetype plugin on

" fix broken indent when commenting-out lines with #
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab indentkeys-=0#

if has("gui_running")
  " Maximize gvim window
  set lines=999 columns=999

  " unlike in terminal, in gui I always want to have line numbers
  se nu
endif

set incsearch
"set hlsearch

"set shiftwidth=4
"set smarttab
"set expandtab
"set autoindent
"set showmatch  " not needed
"set smartcase "ignorecase or smartcase


" set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

"always hide swap files
"let g:netrw_list_hide= '^\..*\.sw[op]$'

" autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
