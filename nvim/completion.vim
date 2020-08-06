
" =============================================================================
"                                AUTO COMPLETION
" =============================================================================

"                                                   conqueror of completion {{{
" =============================================================================
set updatetime=300
" select first list item by default, confirm with return
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
" navigate list with tab and shift-tab
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" confirm completion with return
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" jump to prev/next diagnostic position (does not work)
" inoremap <leader>n :call CocAction("diagnosticNext")<CR>

    " \ 'coc-snippets',
    " \ 'coc-pairs',
    " \ 'coc-tsserver',
    " \ 'coc-eslint',
    " \ 'coc-jedi',
let g:coc_global_extensions = [
    \ 'coc-css',
    \ 'coc-html',
    \ 'coc-python',
    \ 'coc-prettier',
    \ 'coc-json',
    \ ]

"" Use `[g` and `]g` to navigate diagnostics
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)
"
"" Use K to show documentation in preview window.
" nnoremap <silent> K :call <SID>show_documentation()<CR>

" python
" set statusline^=%{coc#status()}
"
" }}}
"                                                                 ultisnips {{{
" =============================================================================
"
" save snippets to
let g:UltiSnipsSnippetsDir='~/.config/nvim/UltiSnips/'
" load snippets from
let g:UltiSnipsSnippetDirectory='~/.config/nvim/UltiSnips/'
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
" autoclose brackets (obsolete with plugin
" inoremap ( ()<left>
" inoremap [ []<left>
" inoremap { {}<left>
" inoremap " ""<left>
" inoremap ' ''<left>

" define filetypes for checklist autocompletion on "- [ ] <CR>"
let g:checklist_filetypes = ['markdown', 'text', 'org']  ", 'wiki', 'vimwiki']

" makes command mode file auto completion prettier 
" set wildmode=longest,list,full  " TODO: really necessary? i also have coc...

" }}}
