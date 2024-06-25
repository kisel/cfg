" Common template cfg. not for include
se bg=dark

syn on
set incsearch
set hls

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

if exists('g:loaded_plug')
" assuming it is auto-loaded
" https://github.com/junegunn/vim-plug/
" https://github.com/junegunn/vim-plug?tab=readme-ov-file#installation
" curl https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 
"   windown location : ~\vimfiles\autoload\plug.vim
"   linux location: ~\.vim\autoload\plug.vim
cal plug#begin()

" List your plugins here
Plug 'tpope/vim-sensible'

" https://github.com/junegunn/fzf.vim?tab=readme-ov-file#commands
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
nmap <C-P> :FZF<CR>


Plug 'tpope/vim-fugitive'

call plug#end()
endif




