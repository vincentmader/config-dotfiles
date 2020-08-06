
" =============================================================================
"                                   STATUS BAR
" =============================================================================

"                                                                 AIRLINE SETUP
" -----------------------------------------------------------------------------
" deactivate standard status bar
set noshowmode
set noruler
" activate tabline, move airline to top and activate fonts
let g:airline#extensions#tabline#enabled = 1
let g:airline_statusline_ontop=0
let g:airline_powerline_fonts = 1
"                                                               AIRLINE CONTENT
" -----------------------------------------------------------------------------
" let g:airline_section_a=''  " disables mode
" let g:airline_section_b=''  " disables version control info
let g:airline_section_c=''  " disables filename
let g:airline_section_x=''  " disables file type
let g:airline_section_y=''  " disables file encoding
let g:airline_section_z=''  " disables location in file
"                                                                 AIRLINE THEME
" -----------------------------------------------------------------------------
" let g:airline_theme='minimalist' 
" let g:airline_theme='distinguished' 
" let g:airline_theme='murmur' 
" let g:airline_theme='powerlineish' 

" let g:airline_solarized_bg='dark'
"                                                                       VARIOUS
" -----------------------------------------------------------------------------
" let g:airline#extensions#coc#enabled = 1
"                                                 same theme for TMUX statusbar
let g:tmuxline_preset = {
    \'a'    : '#S',
    \'b'    : '',
    \'c'    : '',
    \'win'  : '#I #W',
    \'cwin' : '#I #W',
    \'x'    : '',
    \'y'    : '%a %d, %R',
    \'z'    : ''}
