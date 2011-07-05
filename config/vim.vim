set nocompatible

let $SC='$HOME/CONFIG/vim'
let $CFG='$HOME/CONFIG/gvim.vim'


map <S-F1> :help quickref <CR>
nmap <F2> :w<CR>
map <F4> :!sh %:p<CR>
map <C-F4> :!sh %:p -X <CR>
map <S-F4> :!sh -x %:p<CR>
map <A-q> @@
map <F9> :edit $CFG <CR>
map <A-F9> :so $CFG <CR>

map <F11> :map <F5>  :!sh %:p<CR
map <A-'> :next<CR>
map <A-;> :previous<CR>
map <F12> :cnext<CR>
map <S-F12> :cprevious<CR>

map <F21> <ESC>0i#<ESC>

set shell=cmd
set shcf=/c
so $SC/supertab.vim
so $SC/fileshell.vim
set sh=cmd
set nu
map <F5> :call ShellFile()<CR>
"set lz

set nocompatible
set cursorline

"set noswapfile

set shell=cmd
set shcf=/c
set nu

so $SC/supertab.vim
so $SC/fileshell.vim
set sh=cmd
set nu

map <F5> :call ShellFile()<CR>

set fileencodings=utf-8,cp1251,koi8-r,cp866

set wildmenu

set wcm=<Tab>
menu Encoding.Read.utf-8<Tab><F7> :e ++enc=utf8 <CR>
menu Encoding.Read.windows-1251<Tab><F7> :e ++enc=cp1251<CR>
menu Encoding.Read.koi8-r<Tab><F7> :e ++enc=koi8-r<CR>
menu Encoding.Read.cp866<Tab><F7> :e ++enc=cp866<CR>
map <F7> :emenu Encoding.Read.<TAB>

" Настраиваем переключение раскладок клавиатуры по <C-^>
"set keymap=russian-jcukenwin
" Раскладка по умолчанию - английская
"set iminsert=0

set tabstop=2
set shiftwidth=2
set smarttab
set et "— включим автозамену по умолчанию

set ai " — включим автоотступы для новых строк
set cin " — включим отступы в стиле Си

set showmatch
set nohlsearch
set incsearch
set smartcase "ignorecase smartcase 

set lz


set guioptions-=T "Toolbar
"set guioptions-=m "menu


syntax on
filetype on
filetype indent on
filetype plugin on

"map ,# :s/^/#/<CR>
map <M-]> :tabnext<CR>
map <M-[> :tabprevious<CR>
nmap <M-t> :tabnew<CR>
nmap <M-Q> :q!<CR>
"imap <M-]> :tabnext<CR>
"imap <M-[> :tabprevious<CR>
"imap <M-t> :tabnew<CR>
"
"
