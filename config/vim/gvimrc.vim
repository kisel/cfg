let $SC='$HOME/config/vim' 
let $CFG='$SC/gvim.vim'

source $SC/vimrc.vim
source $SC/colors/ayende.vim

so $SC/supertab.vim
so $SC/fileshell.vim


set lines=99999 columns=99999
set nocompatible
set lazyredraw


map <S-F1> :help quickref <CR>
nmap <F2> :w<CR>
map <F3> :help quickref <ENTER>
map <F4> :!sh %:p<CR>
map <C-F4> :!sh %:p -X <CR>
map <S-F4> :!sh -x %:p<CR>
map <F5> :call ShellFile()<CR> 
map <A-q> @@
map <F9> :edit $CFG <CR>
map <A-F9> :so $CFG <CR>
map <F5> :call ShellFile()<CR>
map <F11> :map <F5>  :!sh %:p<CR
map <F12> :cnext<CR>
map <S-F12> :cprevious<CR>

map <F21> <ESC>0i#<ESC>

set number
set nocompatible
set cursorline

if has("unix")
  set nobackup
  au GUIEnter * simalt ~x
else
  set lines=99999 columns=99999
  set guifont=Consolas:h13:cDEFAULT
  set backup
  set backupdir=$TEMP
  set sh=cmd
  set shell=cmd
  set shcf=/c
  source $VIMRUNTIME/mswin.vim " Use CUA keystrokes for clipboard: CTRL-X, CTRL-C, CTRL-V 
endif 

"set noswapfile

set fileencodings=utf-8,cp1251,koi8-r,cp866

set wildmenu

set wcm=<Tab>
menu Encoding.Read.utf-8<Tab><F7> :e ++enc=utf8 <CR>
menu Encoding.Read.windows-1251<Tab><F7> :e ++enc=cp1251<CR>
menu Encoding.Read.koi8-r<Tab><F7> :e ++enc=koi8-r<CR>
menu Encoding.Read.cp866<Tab><F7> :e ++enc=cp866<CR>
map <F7> :emenu Encoding.Read.<TAB>

set guioptions-=T "Toolbar
"set guioptions-=m "menu

syntax on
filetype on
filetype indent on
filetype plugin on

"map ,# :s/^/#/<CR>
map <M-]> :tabnext<CR>
map <M-[> :tabprevious<CR>
map <M-t> :tabnew<CR>
imap <M-]> :tabnext<CR> 
imap <M-[> :tabprevious<CR>
imap <M-t> :tabnew<CR>
    

