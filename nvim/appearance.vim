
" =============================================================================
"                                   APPEARANCE
" =============================================================================

" turn on syntax highlighting (needs to be up here to not conflict w/ SignCol)
syntax on

"                                                                    EDITOR {{{
" =============================================================================
"
set cursorline
set number relativenumber
set showcmd

"                                                                   colorscheme
colorscheme solarized
let g:solarized_termcolors=256
set background=dark

"                                         always display column where errors go
set signcolumn=yes
highlight clear SignColumn

"                                     display column to signify the 81st column
set textwidth=80
set colorcolumn=+1
highlight ColorColumn ctermbg=236

" }}}
"                                                       SYNTAX HIGHLIGHTING {{{
" =============================================================================
"
"      highlight matching for (), [], {}, and <>   (switch between them with %)
set showmatch
set matchpairs+=<:>

"                                         use the colorizer pugin for hex codes 
autocmd BufEnter * :ColorHighlight <CR>

"                                                     flag erroneous whitespace
" au BufRead, BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
"
"                                                      show indentation markers
let g:indentLine_char = '▏'
autocmd BufLeave * :IndentLinesEnable
autocmd BufEnter *.tex :IndentLinesDisable 
autocmd BufEnter *.vim :IndentLinesDisable 

" }}}
"                                                                   VARIOUS {{{
" =============================================================================
"
"                                                                   Taskwarrior
highlight taskwarrior_priority ctermbg=white ctermfg=green 
let g:task_highlight_field=0
let g:task_readonly=0

"                                                                  todoCheckbox
" if exists("b:current_syntax")
"   finish
" endif

" " Custom conceal
" syntax match todoCheckbox "\[\ \]" conceal cchar=
" syntax match todoCheckbox "\[x\]" conceal cchar=
" syntax match todoCheckbox "- \[\ \]" conceal cchar=
" syntax match todoCheckbox "- \[x\]" conceal cchar=

" let b:current_syntax = "todo"

" hi def link todoCheckbox Todo
" hi Conceal guibg=NONE

" setlocal cole=1
"
" }}}
