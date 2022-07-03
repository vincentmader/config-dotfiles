
" =============================================================================
"                           conqueror of completion 
" =============================================================================

" highlight CocErrorFloat ctermfg=Green 
" highlight CocErrorFloat ctermbg=Green  " TODO not working
highlight CocFloating ctermbg=Black

" highlight Pmenu guifg=#0000FF


"                                                                coc extensions
" =============================================================================

let g:coc_global_extensions = [
    \ 'coc-css',
    \ 'coc-eslint',
    \ 'coc-flutter',
    \ 'coc-fzf-preview',
    \ 'coc-html',
    \ 'coc-json',
    \ 'coc-pairs',
    \ 'coc-prettier',
    \ 'coc-rls',
    \ 'coc-snippets',
    \ 'coc-tsserver',
    \ 'coc-vimtex',
\ ]
    " \ 'coc-jedi',
    " \ 'coc-python',

"                                                               code completion 
" =============================================================================

" Use <Tab> and <S-Tab> to navigate the completion list:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" select first list item by default, confirm with return
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
" confirm completion with return
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Close the preview window when completion is done. (TODO: necessary?)
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

"                                                 awesome language-server stuff
" =============================================================================

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

"" Use K to show documentation in preview window.
function! s:show_documentation()
    if (index(['vim', 'help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction
nnoremap <silent> K :call <SID>show_documentation()<CR>
"
"" Use `[g` and `]g` to navigate diagnostics
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)

"                                                                       various
" =============================================================================

" python
" set statusline^=%{coc#status()}

