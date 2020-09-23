
" =============================================================================
"                                   APPEARANCE
" =============================================================================

" turn on syntax highlighting (needs to be up here to not conflict w/ SignCol)
syntax on

"                                                                    EDITOR {{{
" =============================================================================
"
" set cursorline
set number relativenumber
set showcmd

"                                                                   colorscheme
colorscheme solarized
" colorscheme codedark
" colorscheme gruvbox
let g:solarized_termcolors=256
set background=dark
                                                  " make background transparent
highlight Normal guibg=None ctermbg=None

"                                         always display column where errors go
set signcolumn=yes
highlight clear SignColumn

"                                     display column to signify the 81st column
set textwidth=80
set colorcolumn=+1
highlight ColorColumn ctermbg=235

" }}}
"                                                       SYNTAX HIGHLIGHTING {{{
" =============================================================================
"
"      highlight matching for (), [], {}, and <>   (switch between them with %)
set showmatch
set matchpairs+=<:>

"                                         use the colorizer pugin for hex codes 
" autocmd BufEnter * :ColorHighlight <CR>
" lua require'colorizer'.setup()

"                                                     flag erroneous whitespace
" au BufRead, BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
"
"                                                      show indentation markers

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

"                                              turn off indent lines by default
" autocmd BufEnter * IndentLinesDisable
"


let g:limelight_conceal_ctermfg = "239"  " this color is used by solarized for comments

" }}}
