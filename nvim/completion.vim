
" =============================================================================
"                                AUTO COMPLETION
" =============================================================================

"                                                                 ultisnips {{{
" =============================================================================
"
" save snippets to
let g:UltiSnipsSnippetsDir='$CONF/nvim/UltiSnips/'
" load snippets from
let g:UltiSnipsSnippetDirectory='$CONF/nvim/UltiSnips/'
let g:UltiSnipsSnippetDirectories = ['UltiSnips']

" open new tab when editing running UltiSnipsEdit
let g:UltiSnipsEditSplit='tabdo'

" trigger configuration. do not use <tab> if you use YCM
" let g:UltiSnipsExpandTrigger="<CR>"
" let g:UltiSnipsExpandTrigger="<c-space>"
" move through list
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" use Python 3
let g:UltiSnipsUsePythonVersion=3

" }}}
"                                                                  quickTEX {{{
" =============================================================================
"
let g:quicktex_tex = {
    \' '   : "\<ESC>:call search('<+.*+>')\<CR>\"_c/+>/e\<CR>",
\}

let g:quicktex_math = {
    \' '    : "\<ESC>:call search('<+.*+>')\<CR>\"_c/+>/e\<CR>",
    \'eq'   : '= ',
    \'frac' : '\frac{<+++>}{<++>} <++>',
    \'drv' : '\frac{d<+++>}{d<++>} <++>',
    \'pdrv' : '\frac{\partial<+++>}{\partial<++>} <++>',
    \'in'   : '\in ',
    \'bn'   : '\mathbb{N} ',
    \'set'   : '\{ <+++> \} <++>',
    \'tau'  : '\tau',
\}

" }}}
"                                                                   various {{{
" =============================================================================

"
" autoclose brackets
" inoremap ( ()<left>
" inoremap [ []<left>
" inoremap { {}<left>
" inoremap " ""<left>
" inoremap ' ''<left>

" define filetypes for checklist autocompletion on "- [ ] <CR>"
let g:checklist_filetypes = ['markdown', 'text', 'org']  ", 'wiki', 'vimwiki']

" makes command mode file auto completion prettier 
" set wildmode=longest,list,full  " TODO: really necessary? i also have coc...

" deactivate coc in rust & toml files
" autocmd BufNew,BufEnter *.rs,*.toml execute "silent! CocDisable"
" autocmd BufLeave *.rs,*.toml execute "silent! CocEnable"

" }}}
