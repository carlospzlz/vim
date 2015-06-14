"==============================================================================
" GREEN GOBLIN COLORSCHEME
"==============================================================================

set background=dark
highlight clear

if exists('syntax_on')
	syntax reset
endif

let g:colors_name = 'greengoblin'

" Vim color groups
highlight Normal ctermfg=255 ctermbg=0
highlight LineNr ctermfg=248 ctermbg=NONE
highlight ColorColumn ctermfg=NONE ctermbg=240
highlight Search ctermbg=214
highlight Pmenu ctermbg=162
highlight PmenuSel ctermbg=240

" Goblin Colors
let s:skin = 10
let s:vest = 13
let s:pumpkin = 214
let s:fire = 210
let s:comment = 69
let s:string = 123
let s:number = 11
let s:white = 255

" Vim script groups
:exe 'highlight vimVar ctermfg=' . s:skin . ' ctermbg=NONE cterm=bold'
:exe 'highlight vimCommand ctermfg=' . s:vest . ' ctermbg=NONE'
:exe 'highlight vimLineComment ctermfg=' . s:comment . ' ctermbg=NONE'
:exe 'highlight vimNumber ctermfg=' . s:number. ' ctermbg=NONE'
:exe 'highlight vimString ctermfg=' . s:string . ' ctermbg=NONE'
:exe 'highlight vimOption ctermfg=' . s:pumpkin . ' ctermbg=NONE'
:exe 'highlight vimOper ctermfg=' . s:white . ' ctermbg=NONE'
" Vest links
highlight link vimIsCommand vimCommand
highlight link vimLet vimCommand
highlight link vimMap vimCommand
" Pumpkin links
highlight link vimHiGroup VimOption
" Number links
highlight link vimSet vimNumber
highlight link vimSetEqual vimNumber
highlight link vimOption vimNumber
highlight link vimHiNmbr vimNumber

" Python color groups
:exe 'highlight pythonFunction ctermfg=' . s:skin . 'ctermbg=NONE cterm=bold'
:exe 'highlight pythonComment ctermfg=' . s:comment . ' ctermbg=NONE'
:exe 'highlight pythonInclude ctermfg=' . s:vest . ' ctermbg=NONE cterm=bold'
:exe 'highlight pythonStatement ctermfg=' . s:vest . 'ctermbg=NONE'
:exe 'highlight pythonString ctermfg=' . s:string . ' ctermbg=NONE'
:exe 'highlight pythonBuiltin ctermfg=' . s:pumpkin . 'ctermbg=NONE'
:exe 'highlight pythonExceptions ctermfg=' . s:fire . 'ctermbg=NONE'
:exe 'highlight pythonNumber ctermfg=' . s:number . 'ctermbg=NONE'
" Vest links
highlight link pythonException pythonStatement
highlight link pythonConditional pythonStatement 
highlight link pythonRepeat pythonStatement
highlight link pythonOperator pythonStatement 
