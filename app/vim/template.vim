" Common template cfg. not for include
set nocompatible
set background=dark

set shiftwidth=4
set expandtab
"
" allow switching files on modified files
set hidden

syntax on
filetype on
filetype indent on
filetype plugin on

if has("win32")
    set shell=pwsh
    "set shellcmdflag="-c"
endif
if (has("gui_running") && has("win32"))
    " theme must be installed
    colo solarized8
    se guifont=Consolas:h12
    " C:\Users\%USERNAME%\vimfiles\pack
endif
if has("gui_running")
  " Maximize gvim window
  set lines=999 columns=999

  " unlike in terminal, in gui I always want to have line numbers
  se nu
endif

" assuming plug.vim is auto-loaded from
"   windown location : ~\vimfiles\autoload\plug.vim
"   linux location: ~\.vim\autoload\plug.vim
" install:
" -   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" -   https://github.com/junegunn/vim-plug?tab=readme-ov-file#installation
"
try
    call plug#begin()

    " List your plugins here
    Plug 'tpope/vim-sensible'

    " https://github.com/junegunn/fzf.vim?tab=readme-ov-file#commands
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    nmap <C-P> :FZF<CR>


    Plug 'tpope/vim-fugitive'

    call plug#end()
catch /Unknown function/
    " in case this environment doesn't include autoload plug.vim
    " for example on git commit with EDITOR=vim
endtry


