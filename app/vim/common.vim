set nocompatible
set background=dark

" default sw is 8 - use 4 instead
set shiftwidth=4
" default indent adds tab. use space instead
set expandtab
" Number of spaces that a <Tab> in the file counts for
"set tabstop=4
"
" allow switching buffers on modified files
set hidden

" disable bell
set belloff=all

" show numbers on netrw. :help netrw-P18
let g:netrw_bufsettings = 'noma nomod nu nowrap ro nobl'
autocmd FileType netrw setlocal number
" - to edit
nnoremap - :Ex<CR>

" Delete buffer
nnoremap <leader>wq :bdel<CR>


syntax on
filetype on
filetype indent on
filetype plugin on


" fix broken indent when commenting-out lines with #
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab indentkeys-=0#
" yaml indent (still not great)
autocmd FileType yaml setlocal foldmethod=indent foldlevel=9
autocmd FileType go setlocal noexpandtab

if has("gui_running")
  " Maximize gvim window
  set lines=999 columns=999

  " unlike in terminal, in gui I always want to have line numbers
  se nu
endif

set incsearch
set hlsearch
" :noh on ESC
nnoremap <ESC> :nohlsearch<CR>

" Minimal number of screen lines to keep above and below the cursor.
set scrolloff=3

"set shiftwidth=4
"set smarttab
"set expandtab
"set autoindent
"set showmatch  " not needed
"set smartcase "ignorecase or smartcase


" set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

"always hide swap files
let g:netrw_list_hide= '^\..*\.sw[op]$'

" disable swap and undo files to avoid creating .swp and .un~ files
set noswapfile
set noundofile

" paste over something keeping the register. "_P
xmap <leader>p "_dP

" have x (removes single character) not go into the default registry
nnoremap x "_x

" Easy movements without Ctrl-W
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l
" Some terminals with recognize Ctrl-h as Backspace
noremap <C-BS> <C-W>h


