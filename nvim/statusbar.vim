
" =============================================================================
"                                   STATUS BAR
" =============================================================================

"                                                                 AIRLINE SETUP
" -----------------------------------------------------------------------------
"                                                 deactivate default status bar
set noshowmode
set noruler
"                                                    activate tabline and fonts
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
"                                                                move to bottom
let g:airline_statusline_ontop = 0

"                                                               AIRLINE CONTENT
" -----------------------------------------------------------------------------
let g:airline_extensions = ["tabline"]    " an empty list disables all extensions
let g:airline_section_a = ''  " disables mode
" let g:airline_section_b = ''  " disables version control info
" let g:airline_section_c = ''  " disables filename
let g:airline_section_x = ''  " disables file type
let g:airline_section_y = ''  " disables file encoding
" let g:airline_section_z = '%3p%% %3l/%L:%3v'
let g:airline_section_z = ''  " disables location in file
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'

"                                                                 AIRLINE THEME
" -----------------------------------------------------------------------------
let g:airline_theme = 'solarized' 
let g:airline_solarized_bg = 'dark'

"                                                                       VARIOUS
" -----------------------------------------------------------------------------
"                                                 coc info display in statusbar
let g:airline#extensions#coc#enabled = 1

"                                                 same theme for TMUX statusbar
" let g:tmuxline_preset = {                         " -> deactivated
"     \'a'    : '#S',
"     \'b'    : '',
"     \'c'    : '',
"     \'win'  : '#I #W',
"     \'cwin' : '#I #W',
"     \'x'    : '',
"     \'y'    : '%a %d, %R',
"     \'z'    : ''}
