"==============================================================================
" PERSONAL CHECK
"==============================================================================

" Global regex's for undesired patterns
let s:trailingSpaces = '[ \t]\+$'
let s:wrongEqual = '[^ =]=[^ =]\|[^ =+*-/!]=\|=[^ =]'
let s:wrongLeftParenthesis = '([^ )]'
let s:wrongRightParenthesis = '[^ \t(])'
let s:wrongComma = ',[^ $]'

function check#Check()
	if exists( "w:check" )
		if w:check
			return
		endif
	endif
	call matchadd( "Error", s:trailingSpaces, -1, 9)
	call matchadd( "Error", s:wrongEqual, -1, 10 )
	call matchadd( "Error", s:wrongComma, -1, 11)
	let w:check = 1
endfunction

function check#NoCheck()
	if w:check
		call matchdelete( 9 )
		call matchdelete( 10 )
		call matchdelete( 11 )
		let w:check = 0
	endif
endfunction
