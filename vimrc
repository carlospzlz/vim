"==============================================================================
" CARLOSPZLZ VIMRC
"==============================================================================

" No compatible with VI, let it be iMproved.
" This has to be set at the beginning of the file because it changes other
" options as side effects.
set nocompatible


"==============================================================================
" VUNDLE
"==============================================================================
" Thanks to Gmarik organization.

" This is required to use vundle.
filetype off
" Set the runtime path to include Vundle.
set rtp+=~/.vim/bundle/Vundle.vim

" Vundle main
call vundle#begin()
" Vundle manages himself. Required.
Plugin 'gmarik/Vundle.vim'
" Loading Syntastic for checking using external checkers.
Plugin 'scrooloose/syntastic'
" Loading Greengoblin.
Plugin 'carlospzlz/greengoblin'
" Loading Solarized.
Plugin 'altercation/vim-colors-solarized'
" Loading Tagbar
Plugin 'majutsushi/Tagbar'
call vundle#end()

" We need to enable file-type based indentation so vundle works properly.
filetype plugin indent on


"==============================================================================
" SYNTASTIC
"==============================================================================
" Thanks to Martin Grenfell.

" Syntastic settings
let g:sytanstic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_no_open = 1
let g:syntastic_check_on_wq = 0

" Syntastic checkers
let g:syntastic_python_checkers = ["pylint"]
" pylint ignored warnings are loaded in from .pylintrc.
" pep8 ignored warnings are passed as arguments.
let g:syntastic_python_pep8_args = "--ignore=W191"
let g:syntastic_aggregate_errors = 0

let g:python_checkers = ["pylint", "pep8"]
let g:python_checker_index = 0
" Cycling around python checkers
function CyclePythonChecker()
	let g:python_checker_index = (g:python_checker_index + 1) % len(g:python_checkers)
	let g:syntastic_python_checkers = [g:python_checkers[g:python_checker_index]]
	let g:syntastic_python_checkers
endfunction
command CyclePythonChecker call CyclePythonChecker()

" Mappings to use syntastic with shortcuts
nmap <F5> :SyntasticCheck<CR>
nmap <F6> :CyclePythonChecker<CR>
nmap <F7> :SyntasticReset<CR>
nmap <F8> :SyntasticToggleMode<CR>


"==============================================================================
" TAGBAR
"==============================================================================
nmap <F9> :TagbarToggle<CR>


"==============================================================================
" PERSONAL CHECK
"==============================================================================
command Check call check#Check()
command Nocheck call check#NoCheck()
au VimEnter * call check#Check()
au BufWinEnter * call check#Check()


"==============================================================================
" STATUSLINE
"==============================================================================

set laststatus=2
set statusline+=%F
set statusline+=%=
set statusline+=%l/%L
set statusline+=\ %c
set statusline+=\ %P
" Syntastic info
set statusline+=%#Error#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*


"==============================================================================
" OTHER SETTINGS
"==============================================================================

" Basic settings
syntax on
set ai
set mouse=a
set tabstop=4
set number
set hlsearch
set nowrap

" Default tab=4 
set tabstop=4
set softtabstop=4
set noexpandtab
set shiftwidth=4

" Colors
" 256 color terminal, the default is term=$TERM
set term=xterm-256color
set t_Co=256
set background=dark
colo greengoblin

" Mapping  to Backspace.
" xterm is configured like that to let tmux remap ^H without remapping
" backspace.
if $TERM == "xterm-256color"
	" normal, visual, select and operator pending mode.
	map <C-?> <BS>
	" insert and command-line mode.
	map! <C-?> <BS>
endif

" Configure mouse inside tmux ( drag splitter )
" tmux => ttymouse = xterm2 which has extended mouse mode.
"if $TERM == "screen"
set ttymouse=xterm2
"endif

" No delay after <ESC>/<Ctrl>+[
set timeoutlen=0


" Folding
set foldmethod=indent
set shiftwidth=1
hi Folded ctermfg=Gray ctermbg=DarkGray
au VimEnter * normal zR
au BufWinEnter * normal zR

" Highlighting final column ( 80 )
" Only supported from vim 7.3
if exists( "+colorcolumn" )
	set cc=80
endif

" Show highlighting groups for current word
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
 	if !exists("*synstack")
	 	return
	endif
	echo map(synstack(line("."), col(".")), 'synIDattr(v:val, "name")')
endfunc
