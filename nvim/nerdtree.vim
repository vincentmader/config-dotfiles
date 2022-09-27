
"                                                NERDTree (visual file manager) 
" =============================================================================
" let files/directories be created/removed/modified
set modifiable
""" change window size
""let NERDTreeWinSize=33
" only show relevant files
let NERDTreeIgnore=['\.pyc$', '\~$', 'node_modules', '__pycache__', '.DS_Store', '\.aux', '\.fdb_latexmk', '\.fls', '\.log', '\.nav', '\.out', '\.snm', '\.gz', '\.toc', '\.lof', '\.dvi', 'target', 'Cargo.lock']
" but do show hidden files (starting with colon)
let NERDTreeShowHidden=1
" show bookmarks
let NERDTreeShowBookmarks=1
" don't show "Press ? for help"
let NERDTreeMinimalUI = 1
""" show little arrows for expandable directories (is =1 by default anyway?)
""let NERDTreeDirArrows = 1
" remap jump to siblings to avoid conflict with tmux pane change
let g:NERDTreeMapJumpPreviousSibling = '<M-k>'
let g:NERDTreeMapJumpNextSibling = '<M-j>'
""" open tree automatically, but only if not invoked by Git
"""autocmd VimEnter * if &filetype !=# 'gitcommit' | NERDTree | wincmd p | endif
" close tree if only window open is tree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif 

"""let NERDTreeAutoDeleteBuffer = 1
"""let g:NERDTreeShowIgnoredStatus = 1

"""autocmd VimEnter * NERDTree                 " open nerdtree in all tabs
"""autocmd BufEnter * NERDTreeMirrorOpen
"""autocmd VimEnter * wincmd w

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

