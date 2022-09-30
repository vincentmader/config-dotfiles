
" -----------------------------------------------------------------------------
" |                                 APPEARANCE                                |
" -----------------------------------------------------------------------------

"                                    General                                {{{
" =============================================================================

    " Turn on syntax highlighting. 
    " - NOTE: needs to be up here in file, to not conflict with SignCol
      syntax on

    " Show typed commands in lower-right corner of editor window.
    " - TODO: Change `ctermfg` for `showcmd` display-text. -> Green?
      set showcmd

    " Deactivate welcome text by setting its color to background.
    " - NOTE: Welcome text is deactivated anyways. -> Not needed anymore.
    " autocmd BufEnter * :highlight NonText guifg=bg<CR>

    " CURSOR
    " -------------------------------------------------------------------------
    " Show on which line the cursor is by highlighting the whole row.
    " set cursorline

    " Always have at least 5 lines above/below cursor on screen.
      set scrolloff=12

    " LINE NUMBERING
    " -------------------------------------------------------------------------
    " Setup method of displaying line-numbers on the left side of the editor.
    " Use relative numbers in normal mode.
      set number relativenumber
    " Switch to absolute line numbering when in insert mode.
      augroup numbertoggle
          autocmd!
          autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
          autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
      augroup END
    " Make background transparent. TODO Why does this not affect the colors?
      " highlight LineNr ctermbg=None ctermfg=None
      " highlight LineNr ctermbg=red ctermfg=red    

" }}}
"                               Theme/Colorscheme                           {{{
" =============================================================================

    " Specify name of colorscheme.
      colorscheme solarized

    " Enable dark-mode.
      set background=dark

    " Tell vim to use degraded colors.
    " - Needs to be active for solarized-black iTerm profile.  TODO [#B] Really?
    " - See: https://github.com/altercation/vim-colors-solarized#important-note-for-terminal-users
      " let g:solarized_termcolors=256                      

" }}}
"                               Syntax Highlighting                         {{{
" =============================================================================

     " Highlight matching brackets for (), [], {}, and <>   
    " - NOTE: Switch between them with %
      set showmatch
      set matchpairs+=<:>

    " Use colorizer pugin to display RGBA hex-codes in corresponding color.
      " autocmd BufEnter * :ColorHighlight <CR>
      " lua require'colorizer'.setup()

    " Flag erroneous whitespace.
    " au BufRead, BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

    " Show indentation markers.
    " NOTE: todo

" }}}
"                                   Sign Column                             {{{
" =============================================================================

    " SIGN COLUMN & COLOR COLUMN (left & 'right')
    " -------------------------------------------------------------------------
    " Always display sign-column where error symbols would be displayed.
      set signcolumn=yes
      highlight clear SignColumn
      highlight SignColumn ctermfg=none ctermbg=none guifg=none guibg=none
      "               ^ does nothing

" }}}
"                                  Color Column                             {{{
" =============================================================================
    " NOTE: deactivated

    " Method A: Display color-column to signify the 81st column.
    " set textwidth=80
    " set colorcolumn=81
    " highlight ColorColumn ctermbg=235

    " Method B: Color text after column 80 in e.g. red.
    " au BufEnter *.wiki let b:is_wiki_file=1
    " au BufEnter *.vimwiki let b:is_wiki_file=1
    " if !exists("b:is_wiki_file")
    "     " echo exists("b:is_wiki_file")
    "     " echo b:is_wiki_file
    "     autocmd BufEnter * match Error /\%>80c/
    " endif

" }}}
"                                  Transparency                             {{{
" =============================================================================
    " TODO: Clean up!

    " NOTE: This needs to be active for solarized-black iTerm profile.
    " TODO: What does this do? Do I actually need it?
      " highlight Normal guibg=None ctermbg=None  
      " highlight EndOfBuffer guifg=None ctermfg=0 ctermbg=none

    " TODO: What do these do? 
    " highlight Normal guibg=None ctermbg=None  
    " highlight Normal ctermfg=None ctermbg=000000
    " highlight Normal ctermfg=None ctermbg=None
    " hi Normal guibg=none ctermbg=NONE
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

" }}}
"                                    Fonts                                  {{{
" =============================================================================

    " Use Hack Nerd in GUI-vim as well.
      set guifont="Hack Nerd Font"

" }}}
"                                   TaskWarrior                             {{{
" =============================================================================

    " NOTE: very messy

    " Taskwarrior
    " highlight taskwarrior_priority ctermbg=white ctermfg=green 
    " let g:task_highlight_field=0
    " let g:task_readonly=0
    
    " todoCheckbox
    " if exists("b:current_syntax")
    "   finish
    " endif
    
    " Custom conceal
    " syntax match todoCheckbox "\[\ \]" conceal cchar=
    " syntax match todoCheckbox "\[X\]" conceal cchar=
    " syntax match todoCheckbox "- \[\ \]" conceal cchar=
    " syntax match todoCheckbox "- \[X\]" conceal cchar=
    " syntax match todoCheckbox "* \[\ \]" conceal cchar=
    " syntax match todoCheckbox "* \[X\]" conceal cchar=
    " let b:current_syntax = "todo"
    
    " hi def link todoCheckbox Todo
    " hi Conceal guibg=NONE

" }}}
"                             Code Collapsing & Folds                       {{{
" =============================================================================

    " Enable folding.
      set foldmethod=manual
    " Fold all on file-open.
      set foldlevel=99
    " Make vim-folds less awful-looking.
      highlight clear Folded
    
    " Preview docstrings in folded mode.
    " let g:SimpylFold_docstring_preview = 1        
    " let g:SimpylFold_fold_docstring=0
    " " don't fold import statements
    " let g:SimpylFold_fold_import=0              
    
    " Nicer folding.
    " function! NeatFoldText()
    "     let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
    "     let lines_count = v:foldend - v:foldstart + 1
    "     let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
    "     let foldchar = matchstr(&fillchars, 'fold:\zs.')
    "     let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
    "     let foldtextend = lines_count_text . repeat(foldchar, 8)
    "     let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
    "     return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
    " endfunction
    " set foldtext=NeatFoldText()

" }}}
"                               TODO                           {{{
" =============================================================================

    " TODO: What does this do? Do I need it?
    hi Pmenu ctermfg=Black ctermbg=White guifg=Black guibg=White
    hi PmenuSel ctermfg=White ctermbg=Black guifg=White guibg=Black

    " TODO: What does this do? Do I need it?
    " augroup colorscheme_coc_setup | au!
    "     au ColorScheme * call s:my_colors_setup()
    " augroup END
    
    " TODO: What does this do? Do I need it?
    " setlocal cole=1
    
    " Turn off indent lines by default.
    " autocmd BufEnter * IndentLinesDisable

    " This color is used by solarized for comments.
      let g:limelight_conceal_ctermfg = "239"  
    
" }}}
