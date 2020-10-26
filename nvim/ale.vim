
" =============================================================================
"                                     ALE
" =============================================================================


"                                                           ALE SYNTAX CHECKING
" -----------------------------------------------------------------------------
"
"                        only run linters named in ale_linters settings (-> ft)
let g:ale_linters_explicit = 1
"                              don't run on startup, but do after saves & edits
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
"                                                           error display style
let g:ale_sign_error = ' ●'  " 'E' '•' '✗' '⚠' 
let g:ale_sign_warning = ' .'  " 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"                                                   configure error list window
let g:ale_open_list = 1
let g:ale_list_window_size = 3
"                                                              go to next error
" nmap <silent> <C-e> <Plug>(ale_next_wrap)
"                                                                define linters
let g:ale_linters = {
\    'javascript': ['eslint'],
\    'python': ['pylint', 'flake8'],
\}
"                                                                 define fixers
" let b:ale_fixers = {'python': ['autopep8', 'black', 'isort', 'yapf', 'trim_whitespace', 'remove_trailing_lines']}
let g:ale_fixers = {
\    'javascript': ['eslint'],
\    'python': ['autopep8', 'isort'],
\}


"                                                      syntastic sytax checking
" -----------------------------------------------------------------------------
"
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 0  " turn off/on location list
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_error_symbol = '>>'  " '✗'
" " define python checker (otherwise error for fstrings)
" let g:syntastic_python_checkers = ['flake8']
" let g:syntastic_python_python_exec = 'python3'

""let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
""nnoremap <Leader>s :SyntasticCheck<CR>

