"==============================================================================
" PERSONAL CHECK
"==============================================================================

" Global regex's for undesired patterns
let g:trailingSpaces = '[ \t]\+$'
let g:wrongEqual = '[^ =]=[^ =]\|[^ =+*-/!]=\|=[^ =]'
let g:wrongLeftParenthesis = '([^ )]'
let g:wrongRightParenthesis = '[^ \t(])'
let g:wrongComma = ',[^ $]'

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

"au VimEnter * call Check()
"au BufWinEnter * call Check()
