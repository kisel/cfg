source $HOME/.cfg/app/vim/common.vim

" use OS clipboard by default for easy copy-paste without "* "+
set clipboard^=unnamed

" Clipboard with Ctrl-Shift-C/V
if has("gui_running") 
    "nnoremap <C-S-c> "+y
    "nnoremap <C-S-v> "+P
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
endif

" line numbers + relative
se nu
se rnu

" assuming plug.vim is auto-loaded from
"   Windown location : ~\vimfiles\autoload\plug.vim
"   Linux location: ~\.vim\autoload\plug.vim
" install Linux:
"   curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" install Windows:
"   curl -fLo $HOME/vimfiles/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
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
    Plug 'ghifarit53/tokyonight-vim'
    Plug 'tomasiser/vim-code-dark'

    call plug#end()
catch /Unknown function/
    " in case this environment doesn't include autoload plug.vim
    " for example on git commit with EDITOR=vim
endtry

" --- Color themes
" 24bit colors support
set termguicolors

try
    " available by default
    "colo slate
    "colo koehler
    "colo industry
    "colo ron
    "colo torte

    " installed
    " colo tokyonight
    colo codedark

    "colo wildcharm " don't see a selection on wildcharm. the following line is a fixup
    "hi Visual ctermfg=NONE ctermbg=59 cterm=reverse
catch /Cannot find/
    colo industry
endtry

