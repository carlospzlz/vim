"==============================================================================
" CARLOSPZLZ VIMRC
"==============================================================================

" Now fish is my main shell, but `PluginInstall` doesn't work with it.
set shell=/bin/bash

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
" Pull Syntastic for checking using external checkers.
Plugin 'scrooloose/syntastic'
" Pull NERD tree.
Plugin 'scrooloose/nerdtree'
" Pull Greengoblin.
Plugin 'carlospzlz/greengoblin'
" Pull Solarized.
Plugin 'altercation/vim-colors-solarized'
" Pull Tagbar.
Plugin 'majutsushi/Tagbar'
" Pull Airline.
Plugin 'bling/vim-airline'
" Pull Fugitive.
Plugin 'tpope/vim-fugitive'
" Pull YouCompleteMe.
Plugin 'Valloric/YouCompleteMe'
" Pull dirvish path navigator.
Plugin 'justinmk/vim-dirvish'
" Pull Gitgutter.
Plugin 'airblade/vim-gitgutter'
" Pull Easy Motion.
Plugin 'easymotion/vim-easymotion'
" Pull Ctrlp.
Plugin 'ctrlpvim/ctrlp.vim'
" Pull games: Tetris, sokoban and Sudoku!
Plugin 'jmanoel7/vim-games'
call vundle#end()

" We need to enable file-type based indentation so vundle works properly.
filetype plugin indent on


"==============================================================================
" SYNTASTIC
"==============================================================================
" Thanks to Martin Grenfell.

" Manual Syntastic
let b:syntastic_mode = "passive"

" Syntastic settings
let g:sytanstic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" Syntastic checkers
let g:syntastic_aggregate_errors = 0

" PYTHON
let g:python_checkers = ["pylint", "pep8"]
" pylint ignored warnings are loaded in from .pylintrc.
" pep8 ignored warnings are passed as arguments.
let g:syntastic_python_pep8_args = "--ignore=W191,E201,E202"
let g:syntastic_python_checkers = ["pylint"]

" CPP
let g:syntastic_cpp_check_header = 1
let g:cpp_checkers = ["gcc", "cpplint", "arc"]
let g:syntastic_cpp_compiler = "gcc"
let g:syntastic_cpp_cpplint_exec = "cpplint"
let g:syntastic_cpp_checkers = ["gcc"]

" Register arc linter
if exists("g:loaded_syntastic_cpp_arc_checker")
	finish
endif
let g:loaded_syntastic_cpp_arc_checker = 1

function! SyntaxCheckers_cpp_arc_getLocList() dict
	let makeprg = self.makeprgBuild(
		\ {"args": "lint --output compiler --severity warning"})
	let errorformat = "%f:%1:%m"

	let errors = SyntasticMake(
		\ {"makeprg": makeprg, "errorformat": errorformat})
	for error in errors
		let error.bufnr = bufnr("")
	endfor
	return errors
endfunction

"call g:SyntasticRegistry.CreateAndRegisterChecker(
"	\ {"filetype": "cpp", "name": "arc"})

" Cycling around checkers
let g:checker_index = 0
function CycleChecker()
	if &filetype == "python"
		let g:checker_index = (g:checker_index + 1) % len(g:python_checkers)
		let g:syntastic_python_checkers = [g:python_checkers[g:checker_index]]
		let g:syntastic_python_checkers
	elseif &filetype == "cpp"
		let g:checker_index = (g:checker_index + 1) % len(g:cpp_checkers)
		let g:syntastic_cpp_checkers = [g:cpp_checkers[g:checker_index]]
		let g:syntastic_cpp_checkers
	endif
endfunction
command CycleChecker call CycleChecker()

" Mappings to use syntastic with shortcuts
nmap <F5> :SyntasticCheck<CR>
nmap <F6> :CycleChecker<CR>
nmap <F7> :SyntasticReset<CR>
nmap <F8> :SyntasticToggleMode<CR>


"==============================================================================
" TAGBAR
"==============================================================================
nmap <F9> :NERDTreeToggle<CR>
nmap <F10> :TagbarToggle<CR>


"==============================================================================
" PERSONAL CHECK
"==============================================================================
command Check call check#Check()
command Nocheck call check#NoCheck()
au VimEnter * call check#Check()
au BufWinEnter * call check#Check()


"==============================================================================
" AIRLINE
"==============================================================================

set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_section_c = airline#section#create(['%F'])
let s:syntastic_section = '%#Error#%{SyntasticStatuslineFlag()}'


"==============================================================================
" YOU COMPLETE ME
"==============================================================================
" Python provider configuration.
let g:python3_host_prog = "/usr/bin/python3"

" let g:loaded_youcompleteme = 1
let g:ycm_global_ycm_extra_conf = "~/.ycm_extra_conf"
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_show_diagnostics_ui = 0

" NOTE: Enabling ycm prevents git-gutter to update when editing a line, it
" will update when you press enter.

"==============================================================================
" CTAGS, JUMP AND ENJOY!
"==============================================================================
set tags=./tags;


"==============================================================================
" GIGUTTER. REAL TIME GIT DIFF
"==============================================================================
set updatetime=250
let g:gitgutter_diff_base = '3.0_BRANCH'
let g:gitgutter_max_signs = 1000


"==============================================================================
" EASY MOTION
"==============================================================================
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)


"==============================================================================
" CONTROL-P
"==============================================================================
let g:ctrlp_map = '<c-f>'
let g:ctrlp_cmd = 'CtrlP'


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
set shiftwidth=4

" Colors
" 256 color terminal, the default is term=$TERM
"set term=xterm-256color
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
" Vim 8 built from source doesn't remove from current line.
set backspace=2

" Configure mouse inside tmux ( drag splitter )
" tmux => ttymouse = xterm2 which has extended mouse mode.
"if $TERM == "screen"
"set ttymouse=xterm2
"endif

" No delay after <ESC>/<Ctrl>+[
set timeoutlen=250


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
nmap <F1> :call <SID>SynStack()<CR>
function! <SID>SynStack()
	if !exists("*synstack")
		return
	endif
	echo map(synstack(line("."), col(".")), 'synIDattr(v:val, "name")')
endfunc

" Buffers
" Hidding them rather than closing them.
set hidden
" Cycling through listed buffers
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>

" Add newline in Normal mode.
nmap <S-s> i<CR><Esc>
