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

syntax on
filetype on
filetype indent on
filetype plugin on


" fix broken indent when commenting-out lines with #
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab indentkeys-=0#
" yaml indent (still not great)
autocmd FileType yaml setlocal foldmethod=indent foldlevel=9

" available by default
"colo slate
"colo koehler
"colo industry
"colo ron
colo torte
"colo wildcharm " don't see a selection
"hi Visual ctermfg=NONE ctermbg=59 cterm=reverse

" Clipboard with Ctrl-Shift-C/V
if has("gui_running") 
    nnoremap <C-S-c> "+y
    nnoremap <C-S-v> "+P
    vnoremap <C-S-c> "+y
    vnoremap <C-S-v> "+P
endif
" Copy to clipboard with Alt-Y/P
nnoremap <A-y> "+y
nnoremap <A-p> "+P


if has("win32")
    set shell=pwsh
    "set shellcmdflag="-c"
endif
if (has("gui_running") && has("win32"))
    " theme must be installed
    "colo solarized8
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


