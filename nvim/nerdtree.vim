
" =============================================================================
"                         NERDTree (visual file manager) 
" =============================================================================

    " Let files/directories be created/removed/modified.
      set modifiable

    " Change window size.
    "let NERDTreeWinSize=33

    " Only show relevant files, hide the rest.
      let NERDTreeIgnore=['\.pyc$', '\~$', 'node_modules', '__pycache__', '.DS_Store', '\.aux', '\.fdb_latexmk', '\.fls', '\.log', '\.nav', '\.out', '\.snm', '\.gz', '\.toc', '\.lof', '\.dvi', 'target', 'Cargo.lock']
    " But DO show hidden files (starting with colon).
      let NERDTreeShowHidden=1

    " Show bookmarks.
      let NERDTreeShowBookmarks=1
    " Don't show "Press ? for help" text.
      let NERDTreeMinimalUI = 1

    " Show little arrows for expandable directories (active by default anyways)
    " let NERDTreeDirArrows = 1

    " Remap jump to siblings to avoid conflict with tmux pane change
      let g:NERDTreeMapJumpPreviousSibling = '<M-k>'
      let g:NERDTreeMapJumpNextSibling = '<M-j>'

    " Open tree automatically, but only if not invoked by Git.
    " autocmd VimEnter * if &filetype !=# 'gitcommit' | NERDTree | wincmd p | endif

    " Close tree automatically, if only window open is tree.
      autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif 
    
    " let NERDTreeAutoDeleteBuffer = 1
    " let g:NERDTreeShowIgnoredStatus = 1

    " Open nerdtree in all tabs.
    " autocmd VimEnter * NERDTree                 
    " autocmd BufEnter * NERDTreeMirrorOpen
    " autocmd VimEnter * wincmd w
    
    " Customize git symbols.
    let g:NERDTreeGitStatusIndicatorMapCustom = {
      \ 'Modified'  : '✹',
      \ 'Staged'    : '✚',
      \ 'Untracked' : '✭',
      \ 'Renamed'   : '➜',
      \ 'Unmerged'  : '═',
      \ 'Deleted'   : '✖',
      \ 'Dirty'     : '✗',
      \ 'Clean'     : '',
      \ 'Ignored'   : '☒',
      \ 'Unknown'   : '?',
      \ }
    
