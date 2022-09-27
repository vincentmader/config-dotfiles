
" =============================================================================
"                                   APPEARANCE
" =============================================================================

" turn on syntax highlighting (needs to be up here to not conflict w/ SignCol)
syntax on

"                                                                    EDITOR {{{
" =============================================================================
"                                                                   colorscheme
    colorscheme solarized  " gruvbox, codedark, solarized
    let g:solarized_termcolors=256
    " ^ TODO needs to be active for solarized-black iTerm profile
" "                                                                    background
    set background=dark
        " highlight Normal guibg=None ctermbg=None  
    " transparent ?

    " highlight Normal ctermfg=None ctermbg=000000
    " highlight Normal ctermfg=None ctermbg=None
    "   hi Normal guibg=none ctermbg=NONE
      " hi NonText guibg=green ctermbg=NONE
      " hi Cursor guibg=red ctermbg=NONE
      " hi ErrorMsg guibg=orange ctermbg=NONE

     " hi Normal guibg=NONE
  " hi NonText guibg=NONE
  " hi ModeMsg guibg=NONE
  " hi MoreMsg guibg=NONE
  " hi ModeArea guibg=NONE
  " hi ErrorMsg guibg=NONE
  " hi Error guibg=NONE
  " hi Directory guibg=NONE
  " hi VertSplit guibg=NONE
  " hi SignColumn ctermbg=red
  " hi EndOfBuffer guibg=NONE
  " hi NormalFloat guibg=NONE
  " hi Folded guibg=NONE
    " highlight Insert ctermfg=None ctermbg=None

    " transparent
    highlight Normal guibg=None ctermbg=None  
    highlight EndOfBuffer guifg=None ctermfg=none ctermbg=none
    " ^ TODO needs to be active for solarized-black iTerm profile
    
    hi Pmenu ctermfg=Black ctermbg=White guifg=Black guibg=White
    hi PmenuSel ctermfg=White ctermbg=Black guifg=White guibg=Black
    hi FgCocErrorFloatBgCocFloating ctermfg=Black ctermbg=White guifg=Black guibg=White

"                         show on which line I am by highlighting the whole row
" set cursorline
"                                                                  show command
set showcmd
"                                                          display line numbers
" switch to abs/rel line numbering when in insert/normal mode
set number relativenumber
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

highlight LineNr ctermbg=None

"                                                 make folds less awful-looking
highlight clear Folded

"                                         always display column where errors go
set signcolumn=yes
highlight clear SignColumn
highlight SignColumn ctermfg=none ctermbg=none guifg=none guibg=none
"               ^ does nothing

"                                     display column to signify the 81st column
" set textwidth=80
" set colorcolumn=81
" highlight ColorColumn ctermbg=235

"                                         new idea: color text red after col 80
" au BufEnter *.wiki let b:is_wiki_file=1
" au BufEnter *.vimwiki let b:is_wiki_file=1
" if !exists("b:is_wiki_file")
"     " echo exists("b:is_wiki_file")
"     " echo b:is_wiki_file
"     autocmd BufEnter * match Error /\%>80c/
" endif


" deactivate welcome text by setting its color to background
" autocmd BufEnter * :highlight NonText guifg=bg<CR>

"                     always have at least 5 lines above/below cursor on screen
set scrolloff=12



" augroup colorscheme_coc_setup | au!
"     au ColorScheme * call s:my_colors_setup()
" augroup END


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
" highlight taskwarrior_priority ctermbg=white ctermfg=green 
" let g:task_highlight_field=0
" let g:task_readonly=0

"                                                                  todoCheckbox
" if exists("b:current_syntax")
"   finish
" endif

" " Custom conceal
" syntax match todoCheckbox "\[\ \]" conceal cchar=
" syntax match todoCheckbox "\[X\]" conceal cchar=
" syntax match todoCheckbox "- \[\ \]" conceal cchar=
" syntax match todoCheckbox "- \[X\]" conceal cchar=
" syntax match todoCheckbox "* \[\ \]" conceal cchar=
" syntax match todoCheckbox "* \[X\]" conceal cchar=
" let b:current_syntax = "todo"

" hi def link todoCheckbox Todo
" hi Conceal guibg=NONE

" setlocal cole=1

"                                              turn off indent lines by default
" autocmd BufEnter * IndentLinesDisable
"


let g:limelight_conceal_ctermfg = "239"  " this color is used by solarized for comments

" hi CocListBgRed guibg=black guifg=red
" hi NvimInternalError guibg=black guifg=red


" hi TabLineFill ctermfg=LightGreen ctermbg=DarkGreen
" hi TabLine ctermfg=Blue ctermbg=Yellow
" hi TabLineSel ctermfg=Red ctermbg=Yellow
" hi Title ctermfg=LightBlue ctermbg=Magenta

set guifont="Hack Nerd Font"

" }}}
