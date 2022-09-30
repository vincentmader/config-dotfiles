
" =============================================================================
"                                AUTO COMPLETION
" =============================================================================
" - ConquerOfCompletion
" - QuickTEX
" - UltiSnips                                                          (unused)
" - YouCompleteMe                                                      (unused)
" - ALE                                                                (unused)

"                                                       ConquerOfCompletion {{{
" ============================================================================= 
    
    " Define list of CoC Extensions.
    " -------------------------------------------------------------------------
    let g:coc_global_extensions = [
        \ 'coc-css',
        \ 'coc-docker',
        \ 'coc-eslint',
        \ 'coc-flutter',
        \ 'coc-fzf-preview',
        \ 'coc-html',
        \ 'coc-jedi',
        \ 'coc-json',
        \ 'coc-pairs',
        \ 'coc-prettier',
        \ 'coc-pyright',
        \ 'coc-rust-analyzer',
        \ 'coc-rls',
        \ 'coc-snippets',
        \ 'coc-tsserver',
        \ 'coc-vimtex',
    \ ]
        " \ 'coc-python',  
        "     ^ -> deprecated, use coc-jedi or coc-pyright instead (or -> and!)

    " Code completion.
    " -------------------------------------------------------------------------
    " Use <Tab> and <S-Tab> to navigate the completion list:
      inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
      inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
    " Select first list item by default, confirm with <Return>.
      inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
    " Confirm completion with <Return>.
    " inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    " Close the preview window when completion is done. 
    " - TODO: necessary?
      autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
    
    " Decrease update-time for CursorHold & CursorHoldI.
    " - TODO: What does this do?
      set updatetime=300
    
    " Documentation for object under cursor.
    " -------------------------------------------------------------------------
    " Use K to show documentation in preview window.
      function! s:show_documentation()
          if (index(['vim', 'help'], &filetype) >= 0)
              execute 'h '.expand('<cword>')
          else
              call CocAction('doHover')
          endif
      endfunction
      nnoremap <silent> K :call <SID>show_documentation()<CR>

    " Various
    " -------------------------------------------------------------------------

    " Remap for renaming current word
    " - TODO: Lookup: What does this do again?
      nmap <F2> <Plug>(coc-rename)

    " Configure CoC error-window colors."
      highlight FgCocErrorFloatBgCocFloating ctermfg=1 ctermbg=0
        " highlight CocFloating ctermbg=Black ctermfg=Green
        " highlight CocErrorFloat ctermbg=Green  
        " highlight Pmenu guifg=#0000FF
        " ^ not working
        " hi CocListBgRed guibg=black guifg=red
        " hi NvimInternalError guibg=black guifg=red

    " python (?)
    " set statusline^=%{coc#status()}

    "
    "" Use `[g` and `]g` to navigate diagnostics.
    " nmap <silent> [g <Plug>(coc-diagnostic-prev)
    " nmap <silent> ]g <Plug>(coc-diagnostic-next)

" }}}
"                                                                  QuickTEX {{{
" =============================================================================

    " Define QuickTEX templates for LaTeX normal mode.
      let g:quicktex_tex = {
          \ ' '    : "\<ESC>:call search('<+.*+>')\<CR>\"_c/+>/e\<CR>",
      \}
    
    " Define QuickTEX templates for LaTeX math mode.
      let g:quicktex_math = {
          \ ' '    : "\<ESC>:call search('<+.*+>')\<CR>\"_c/+>/e\<CR>",
          \ 'eq'   : '= ',
          \ 'frac' : '\frac{<+++>}{<++>} <++>',
          \ 'drv'  : '\frac{d<+++>}{d<++>} <++>',
          \ 'pdrv' : '\frac{\partial<+++>}{\partial<++>} <++>',
          \ 'in'   : '\in ',
          \ 'bn'   : '\mathbb{N} ',
          \ 'set'  : '\{ <+++> \} <++>',
          \ 'tau'  : '\tau',
      \}

" }}}
"                                                                 Ultisnips {{{
" =============================================================================
" - NOTE: Deactivated -> Moved to loading snippets via COC.

    " Define path to directory where snippets should be saved to.
      let g:UltiSnipsSnippetsDir='$XDG_CONFIG_HOME/nvim/UltiSnips/'

    " Define path to directory where snippets should be loaded from.
      " let g:UltiSnipsSnippetDirectory='$XDG_CONFIG_HOME/nvim/UltiSnips/'
      " let g:UltiSnipsSnippetDirectories = ['UltiSnips']
    
    " Open new tab when editing snippets via `:UltiSnipsEdit` in vim.
      " let g:UltiSnipsEditSplit='tabdo'
    
    " Trigger configuration: Do not use <tab> if you use YCM.
      " let g:UltiSnipsExpandTrigger="<CR>"
      " let g:UltiSnipsExpandTrigger="<c-space>"

    " Move through suggestions list via `ctrl-b` and `ctrl-z.`
      " let g:UltiSnipsJumpForwardTrigger="<c-b>"
      " let g:UltiSnipsJumpBackwardTrigger="<c-z>"
    
    " Use Python 3 for UltiSnips.
      " let g:UltiSnipsUsePythonVersion=3

" }}}
"                                                                   Various {{{
" =============================================================================

    " Define filetypes for checklist autocompletion on "- [ ] <CR>".
      " let g:checklist_filetypes = ['markdown', 'text', 'org', 'wiki', 'vimwiki'] 

    " Automatically close brackets.
      " inoremap ( ()<left>
      " inoremap [ []<left>
      " inoremap { {}<left>
      " inoremap " ""<left>
      " inoremap ' ''<left>
    
    " Make command-mode file auto-completion prettier.
      " set wildmode=longest,list,full  " TODO: Really necessary? I also have COC...
    
    " Deactivate COC in .rs & .toml files. 
    " RLS not available in non-nightly a.t.m. -> switched to nightly.
      " autocmd BufNew,BufEnter *.rs,*.toml execute "silent! CocDisable"
      " autocmd BufLeave *.rs,*.toml execute "silent! CocEnable"

" }}}
