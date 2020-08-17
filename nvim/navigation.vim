
" =============================================================================
"                                   NAVIGATION
" =============================================================================

"                                             cursor movement inside buffer {{{
" =============================================================================
"                                                                activate mouse 
set mouse=a  
"                                                move vertically by visual line
nnoremap j gj
nnoremap k gk
"                     always have at least 5 lines above/below cursor on screen
set scrolloff=12
"                                restore last cursor position and marks on open
au BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
    \ |   exe "normal! g`\""
    \ | endif

" }}}
"                                           searching and switching buffers {{{
" =============================================================================
"            search incrementally as characters are entered & highlight matches
set incsearch hlsearch
"             case insensitive except if capital letters are entered explicitly
set ignorecase smartcase

" }}}
"                                                                vim splits {{{
" =============================================================================
"                                        new vim splits go to the right & below
set splitbelow
set splitright
"                                               navigate vim splits with C-hjkl
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

" }}}
"                                               easymotion quick-navigation {{{
" =============================================================================
"<Leader>f{char} to move to {char}
"map  <Leader>f <Plug>(easymotion-bd-f)
"nmap <Leader>f <Plug>(easymotion-overwin-f)
" s{char}{char} to move to {char}{char}
"nmap <Leader>s <Plug>(easymotion-overwin-f2)
" Move to line
"map <Leader>L <Plug>(easymotion-bd-jk)
"nmap <Leader>L <Plug>(easymotion-overwin-line)
" Move to word
" map  <Leader>w <Plug>(easymotion-bd-w)
" nmap <Leader>w <Plug>(easymotion-overwin-w)

" }}}
"                                ag/silver searcher (find file by c-string) {{{
" =============================================================================
" use the silver searcher (a.k.a. ag) instead of ack (only if installed)
if executable('ag')
    let g:ackprg = 'ag --nogroup --nocolor --column'
endif
nnoremap <leader>a :Ack! -Q ""<Left>

" }}}
"                                                                        ranger
" =============================================================================
" deactivate default mapping (<leader>f)
let g:ranger_map_keys = 0 

" }}}
"                                            fzf (file search by file name) {{{
" =============================================================================
"set rtp+=/usr/local/opt/fzf
"command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)" split/vsplit settings
"" " floating fzf
"" let g:fzf_layout = { 'window': 'call FloatingFZF()' }
"" function! FloatingFZF()
""   let buf = nvim_create_buf(v:false, v:true)
""   call setbufvar(buf, '&signcolumn', 'no')
""  
""   let height = float2nr(30)
""   let width = float2nr(60)
""   let horizontal = float2nr((&columns - width) / 2)
""   let vertical = 1
""  
""   let opts = {
""         \ 'relative': 'editor',
""         \ 'row': vertical,
""         \ 'col': horizontal,
""         \ 'width': width,
""         \ 'height': height,
""         \ 'style': 'minimal'
""         \ }
""  
""   call nvim_open_win(buf, v:true, opts)
"" endfunction

" }}}
"                                            NERDTree (visual file manager) {{{
" =============================================================================
""" open with <leader>t
""map <leader>nt :NERDTreeTabsToggle<CR>
""" let files/directories be created/removed/modified
""set modifiable
""" change window size
""let NERDTreeWinSize=33
""" only show relevant files
""let NERDTreeIgnore=['\.pyc$', '\~$', 'node_modules', '__pycache__', '.DS_Store', '\.aux', '\.fdb_latexmk', '\.fls', '\.log', '\.nav', '\.out', '\.snm', '\.gz', '\.toc', '\.lof', '\.dvi']
""" but do show hidden files (starting with colon)
""let NERDTreeShowHidden=1
""" show bookmarks
""let NERDTreeShowBookmarks=1
""" don't show "Press ? for help"
""let NERDTreeMinimalUI = 1
""" show little arrows for expandable directories (is =1 by default anyway?)
""let NERDTreeDirArrows = 1
""" remap jump to siblings to avoid conflict with tmux pane change
""let g:NERDTreeMapJumpPreviousSibling = '<M-k>'
""let g:NERDTreeMapJumpNextSibling = '<M-j>'
""" open tree automatically, but only if not invoked by Git
"""autocmd VimEnter * if &filetype !=# 'gitcommit' | NERDTree | wincmd p | endif
""" close tree if only window open is tree
""autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif 

"""let NERDTreeAutoDeleteBuffer = 1
"""let g:NERDTreeShowIgnoredStatus = 1

"""autocmd VimEnter * NERDTree                 " open nerdtree in all tabs
"""autocmd BufEnter * NERDTreeMirrorOpen
"""autocmd VimEnter * wincmd w

"""let g:NERDTreeIndicatorMapCustom = {
"""  \ 'Modified'  : '✹',
"""  \ 'Staged'    : '✚',
"""  \ 'Untracked' : '✭',
"""  \ 'Renamed'   : '➜',
"""  \ 'Unmerged'  : '═',
"""  \ 'Deleted'   : '✖',
"""  \ 'Dirty'     : '✗',
"""  \ 'Clean'     : ''",
"""  \ 'Ignored'   : '☒',
"""  \ 'Unknown'   : '?'
"""  \ }

" }}}
