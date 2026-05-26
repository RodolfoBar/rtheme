" rtheme - A colorscheme for Vim
" Based on the rtheme Neovim theme
" https://github.com/rodolfobar/rtheme
"
" Author: RodolfoBar
" License: MIT

highlight clear
syntax reset
let g:colors_name = 'rtheme'

if !has('termguicolors')
  finish
endif

let s:fg      = '#eeebff'
let s:bg      = '#110f15'
let s:black   = '#241e2e'
let s:lblack  = '#342d42'
let s:red     = '#ff4f7f'
let s:lred    = '#ff79a0'
let s:green   = '#a6ff65'
let s:lgreen  = '#b9ff91'
let s:yellow  = '#ffa770'
let s:lyellow = '#ffd986'
let s:blue    = '#6daeff'
let s:lblue   = '#76ddff'
let s:purple  = '#b483ff'
let s:lpurple = '#fb97ff'
let s:cyan    = '#36ffc3'
let s:lcyan   = '#6fffe7'
let s:white   = '#706897'
let s:lwhite  = '#a7a5cb'

if get(g:, 'rtheme_transparency', 0)
  let s:bg = 'NONE'
endif

let s:panel_bg = s:black

function! s:hl(group, ...)
  let l:cmd = 'highlight ' . a:group
  if a:0 >= 1 && !empty(a:1)
    let l:cmd .= ' guifg=' . a:1
  endif
  if a:0 >= 2 && !empty(a:2)
    let l:cmd .= ' guibg=' . a:2
  endif
  if a:0 >= 3 && !empty(a:3)
    let l:cmd .= ' guisp=' . a:3
  endif
  if a:0 >= 4 && !empty(a:4)
    let l:cmd .= ' gui=' . a:4
    let l:cmd .= ' term=' . a:4
    let l:cmd .= ' cterm=' . a:4
  endif
  execute l:cmd
endfunction

" Core editor UI
call s:hl('Normal', s:fg, s:bg)
call s:hl('EndOfBuffer', s:black, s:bg)
call s:hl('SignColumn', s:fg, s:bg)
call s:hl('CursorLine', '', s:lblack, '', 'NONE')
call s:hl('CursorColumn', '', s:lblack, '', 'NONE')
call s:hl('ColorColumn', '', s:black)
call s:hl('CursorLineNr', s:yellow, '', '', 'NONE')
call s:hl('LineNr', s:white)
highlight! link LineNrAbove LineNr
highlight! link LineNrBelow LineNr
call s:hl('Whitespace', s:lblack)
call s:hl('FoldColumn', s:white, s:bg)
call s:hl('Folded', s:white, s:bg)
call s:hl('Conceal', s:white)
call s:hl('NonText', s:lblack)
call s:hl('SpecialKey', s:lblack)
call s:hl('Directory', s:blue)
call s:hl('Visual', '', s:lblack)
call s:hl('MatchParen', s:yellow, s:lblack, '', 'bold')
call s:hl('WildMenu', s:black, s:lblue, '', 'bold')
call s:hl('QuickFixLine', '', s:black, '', 'bold')

" Window/split/status/tab
call s:hl('VertSplit', s:lblack, s:bg)
call s:hl('StatusLine', s:fg, s:panel_bg)
call s:hl('StatusLineNC', s:white, s:panel_bg)
call s:hl('TabLine', s:white, s:panel_bg)
call s:hl('TabLineFill', s:white, s:panel_bg)
call s:hl('TabLineSel', s:fg, s:lblack, '', 'bold')

" Popup/completion
call s:hl('Pmenu', s:fg, s:panel_bg)
call s:hl('PmenuSel', s:black, s:lblue, '', 'bold')
call s:hl('PmenuSbar', '', s:lblack)
call s:hl('PmenuThumb', '', s:white)

" Search/match/messages
call s:hl('Search', s:black, s:lyellow)
call s:hl('IncSearch', s:black, s:lblue, '', 'bold')
call s:hl('Substitute', s:black, s:lpurple, '', 'bold')
call s:hl('ErrorMsg', s:red, '', '', 'bold')
call s:hl('WarningMsg', s:lyellow, '', '', 'bold')
call s:hl('MoreMsg', s:lgreen, '', '', 'bold')
call s:hl('ModeMsg', s:lblue, '', '', 'bold')
call s:hl('Question', s:cyan, '', '', 'bold')

" Diff/spell
call s:hl('DiffAdd', s:lgreen, s:black)
call s:hl('DiffChange', s:lblue, s:black)
call s:hl('DiffDelete', s:lred, s:black)
call s:hl('DiffText', s:yellow, s:lblack, '', 'bold')
call s:hl('SpellBad', '', '', s:red, 'undercurl')
call s:hl('SpellCap', '', '', s:lblue, 'undercurl')
call s:hl('SpellLocal', '', '', s:lcyan, 'undercurl')
call s:hl('SpellRare', '', '', s:purple, 'undercurl')

" Terminal
call s:hl('TermCursor', s:black, s:fg)

" Syntax
call s:hl('Comment', s:white)
call s:hl('Function', s:lblue)
call s:hl('Identifier', s:fg)
call s:hl('String', s:lgreen)
call s:hl('Statement', s:purple)
call s:hl('Constant', s:yellow)
call s:hl('Operator', s:lblue)
call s:hl('Delimiter', s:lblue)
call s:hl('Type', s:blue)
call s:hl('Special', s:fg)
call s:hl('PreProc', s:lpurple)
call s:hl('Title', s:yellow)

let g:terminal_ansi_colors = ['#241e2e', '#ff4f7f', '#a6ff65', '#ffa770', '#6daeff', '#b483ff', '#36ffc3', '#706897', '#342d42', '#ff79a0', '#b9ff91', '#ffd986', '#76ddff', '#fb97ff', '#6fffe7', '#a7a5cb']
