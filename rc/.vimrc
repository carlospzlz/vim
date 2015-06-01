" Basic settings
syntax on
set ai
set mouse=a
set tabstop=4
set number

" Mapping  to Backspace.
" xterm is configured like that to let
" tmux remap ^H without remapping
" backspace
if $TERM == "xterm-256color"
	" normal, visual, select and
	" operator pending mode
	map <C-?> <BS>
	" insert and command-line mode
	map! <C-?> <BS>
endif

" Configure mouse inside tmux
" ( drag splitter )
" tmux => ttymouse = xterm2
" which has extended mouse mode
if $TERM == "screen"
	set ttymouse=xterm2
endif

" No delay after <ESC>/<Ctrl>+[
set timeoutlen=0

" Status line showing full path
set laststatus=2
set statusline+=%F
set statusline+=%=
set statusline+=%l/%L
set statusline+=\ %c
set statusline+=\ %P

" Global regex's for undesired patterns
let g:trailingSpaces = '[ \t]\+$'
let g:wrongEqual = '[^ =]=[^ =]\|[^ =+*-/!]=\|=[^ =]'
let g:wrongLeftParenthesis = '([^ )]'
let g:wrongRightParenthesis = '[^ \t(])'
let g:wrongComma = ',[^ $]'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PEP8 Respect
function Pep8()
	if exists( "w:pep8" )
		if w:pep8
			return
		endif
	endif
	call matchadd( "Error", g:trailingSpaces, -1, 4 )
	call matchadd( "Error", g:wrongEqual, -1, 5 )
	call matchadd( "Error", g:wrongLeftParenthesis, -1, 6 )
	call matchadd( "Error", g:wrongRightParenthesis, -1, 7 )
	call matchadd( "Error", g:wrongComma, -1, 8 )
	let w:pep8 = 1
endfunction
command Pep8 call Pep8()

function NoPep8()
	if w:pep8
		call matchdelete( 4 )
		call matchdelete( 5 )
		call matchdelete( 6 )
		call matchdelete( 7 )
		call matchdelete( 8 )
		let w:pep8 = 0
	endif
endfunction
command Nopep8 call NoPep8()

" Disable by default
" au VimEnter * call Pep8()
" au BufWinEnter * call Pep8()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Personal check
function Check()
	if exists( "w:check" )
		if w:check
			return
		endif
	endif
	call matchadd( "Error", g:trailingSpaces, -1, 9)
	call matchadd( "Error", g:wrongEqual, -1, 10 )
	call matchadd( "Error", g:wrongComma, -1, 11)
	let w:check = 1
endfunction
command Check call Check()

function NoCheck()
	if w:check
		call matchdelete( 9 )
		call matchdelete( 10 )
		call matchdelete( 11 )
		let w:check = 0
	endif
endfunction
command Nocheck call NoCheck()

au VimEnter * call Check()
au BufWinEnter * call Check()

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
hi ColorColumn ctermbg=DarkGray

" Colorcolumn emulation.
" This allows set low priority.
let g:lastColumn = '\%>79v'

function ColorColumn()
	if exists( "w:colorColumn" )
		if w:colorColumn
			return
		endif
	endif
	call matchadd( "ColorColumn", g:lastColumn, -2, 12 )
	let w:colorColumn = 1
endfunction
command Cc call ColorColumn()

function NoColorColumn()
	if w:colorColumn
		call matchdelete( 12 )
		let w:colorColumn = 0
	endif
endfunction
command Nocc call NoColorColumn()
