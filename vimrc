"==============================================================================
" PATHOGEN
"==============================================================================
" Thanks to Tim Pope.

" Loading bundles with Pathogen.
call pathogen#infect()
call pathogen#helptags()
" We need to enable file-type based indentation so pathongen works properly.
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
let g:syntastic_python_checkers = ["pylint", "pep8" ]
let g:syntastic_aggregate_errors = 0

" Mappings to use syntastic with shortcuts
nmap <F5> :SyntasticCheck pylint<CR>
nmap <F6> :SyntasticCheck pep8<CR>
nmap <F7> :SyntasticReset<CR>
nmap <F8> :SyntasticToggleMode<CR>


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

" Default tab=4 
set tabstop=4
set softtabstop=4
set noexpandtab
set shiftwidth=4

" Colors
" 256 color terminal, the default is term=$TERM
set term=xterm-256color
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
if $TERM == "screen"
	set ttymouse=xterm2
endif

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