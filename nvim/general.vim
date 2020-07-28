
" =============================================================================
"                                                     GENERAL VIM CONFIGURATION
" =============================================================================

set autoread  " automatically reload files from disk on change
set backspace=indent,eol,start  " allow backspace in insert mode
set encoding=utf-8
set hidden  " buffers can exist in background, common behavior for editors
"                                              copy & paste to system clipboard
" -----------------------------------------------------------------------------
if has('clipboard')
    set clipboard=unnamed
    if has('unnamedplus')  " X11 support
        set clipboard+=unnamedplus
    endif
endif
vnoremap <C-c> :w !pbcopy<CR><CR>
noremap <C-v> :r !pbpaste<CR><CR>
"                                                  default indentation settings
" -----------------------------------------------------------------------------
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent








""" Prompt for a command to run
""map <Leader>vp :VimuxPromptCommand<CR>
""" Run last command executed by VimuxRunCommand
""map <Leader>vl :VimuxRunLastCommand<CR>
""" Inspect runner pane
""map <Leader>vi :VimuxInspectRunner<CR>

"""noremap <r> :so % <Enter>                   " reload vimrc (has lead to crash)

" disables auto comment on new line
" autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"" table mode (activated with <Leader>tm)
"" ----------------------------------------------------------------------------
" alignment
let g:table_mode_align_char = ':'
" ReST compatible
" let g:table_mode_header_fillchar='='
" let g:table_mode_corner_corner='+'

""" setup up of ALE
"" ----------------------------------------------------------------------------
""" Put these lines at the very end of your vimrc file.
""" Load all plugins now.
""" Plugins need to be added to runtimepath before helptags can be generated.
""packloadall
""" Load all of the helptags now, after plugins have been loaded.
""" All messages and errors will be ignored.
""silent! helptags ALL







" disable wrapping for long lines
set nowrap
set formatoptions-=t
" allow autocomment on newline
set formatoptions+=r

" Store lots of :cmdline history
set history=1000                            
au FocusGained,BufEnter * :checktime

" remove trailing whitespaces
command! FixWhitespace :%s/\s\+$//e

" calendar
" let g:calendar_frame = 'default'
"
let g:vimwiki_list = [{'path': '~/Library/Mobile Documents/com~apple~CloudDocs/Documents/wiki'}]
