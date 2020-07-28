
" =============================================================================
"                                   KEY REMAPS
" =============================================================================

"                                                                   LEADER KEYS
" -----------------------------------------------------------------------------
let mapleader="\<space>"
let maplocalleader ="\<tab>"

"                                                                  EDITOR MODES
" -----------------------------------------------------------------------------
"                                                quick-exit insert mode with jk 
inoremap jk <Esc>
"                                                                quick-exit vim
map zz :wq<CR>

"                                                                    NAVIGATION
" -----------------------------------------------------------------------------
"                                                         cycle through buffers
map gn :bn<cr>
map gp :bp<cr>
" map gd :bd<cr> 
"
"                                                       QUICK-OPEN CONFIG FILES
" -----------------------------------------------------------------------------
"                                                                           zsh
map <Leader>cali :tabnew $HOME/.config/zsh/.aliasrc <CR>
map <Leader>czsh :tabnew $HOME/.config/zsh/.zshrc <CR>
"                                                                          tmux
map <Leader>ctmx :tabnew $HOME/.tmux.conf <CR>
"                                                                          nvim
map <Leader>cvim :tabnew $HOME/.config/nvim/init.vim <CR>
command! -nargs=? Ftedit execute "tabe $HOME/.config/nvim/ftplugin/" . ("<args>" == "" ? &filetype : "<args>") . ".vim"
map <Leader>cvft :Ftedit <CR>
map <Leader>ccoc :CocConfig <CR>
map <leader>csnp :UltiSnipsEdit <CR>
" map <Leader>cpl :tabnew ~/.pylintrc <CR>
"                                                                    FUZZY FIND
"" use <leader>fz to open fuzzy finder (type ' next for exact search)
nnoremap <silent> <leader>f :FzfPreviewDirectoryFiles <CR>
"nnoremap <silent> <leader>fg :FzfPreviewProjectFiles<CR>
"nnoremap <silent> <leader>fb :FzfPreviewBuffers <CR>
"nnoremap <silent> <leader>fc :Commits<CR>
"nnoremap <silent> <leader>fbc :BCommits<CR>
" nnoremap <silent> <leader>fs :Snippets<CR>
"" search files by content
"nnoremap <silent> <leader>ff :Rg<CR>  
"" --column: Show column number
"" --line-number: Show line number
"" --no-heading: Do not show file headings in results
"" --fixed-strings: Search term as a literal string
"" --ignore-case: Case insensitive search
"" --no-ignore: Do not respect .gitignore, etc...
"" --hidden: Search hidden files and folders
"" --follow: Follow symlinks
"" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
"" --color: Search color options

"                                                   SWITCH TO MINIMALIST EDITOR
" -----------------------------------------------------------------------------
" Goyo
nmap <Leader>g :Goyo<CR>
xmap <Leader>g :Goyo<CR>

" LimeLight
autocmd! User GoyoEnter Limelight
function MinimalistSetupDisable()
    Limelight!
    highlight clear SignColumn
endfunction
autocmd! User GoyoLeave call MinimalistSetupDisable()
" nmap <Leader>l <Plug>(Limelight)
" xmap <Leader>l <Plug>(Limelight)
" let g:limelight_bop = '^\s'
" let g:limelight_eop = '\ze\n^\s'
" let g:limelight_paragraph_span = 2
"
"                                                               VERSION CONTROL
map <Leader>va :Git add %<CR>
map <Leader>vc :Git commit<CR>
map <Leader>vp :Git push<CR>

"                                                         TASKWARRIOR & VIMWIKI
" -----------------------------------------------------------------------------
" nnoremap <leader>t :tabnew <bar> :TW<CR>
map <leader>x :ChecklistToggleCheckbox<CR>
map <leader>y :CalendarH<CR>
"                                                                       VARIOUS
"
" -----------------------------------------------------------------------------
"                                                           reload current file
" map <M-r> :e % <CR>
"                         define shortcut to turn off search match highlighting
nnoremap <leader><space><space> :nohlsearch<CR>
"                                                             move lines around
nnoremap <leader>k :m-2<cr>==
xnoremap <leader>k :m-2<cr>gv=gv
nnoremap <leader>j :m+<cr>==
xnoremap <leader>j :m'>+<cr>gv=gv
"                                                    string datetime formatting 
map <Leader>sfd :pu=strftime('%Y-%m-%d')<CR>
map <Leader>sft :pu=strftime('%H:%M:%S')<CR>
"                                                      spellcheck (orthography)
" map <leader>o: :setlocal spell! spelllang=en_US<CR>
"                                                                       sorting
" map <Leader>ss :sort<CR>
"                                              terminal emulation (a bit buggy)
" nnoremap <silent> <leader>sh :terminal<CR>
"                                       shortcut to source .vimrc (a bit buggy)
" map <Leader>sv :so ~/.vimrc<CR>


map <leader>u :UndotreeToggle <CR>

map <leader>r :FloatermNew --height=0.8 --width=0.8 --wintype=floating --name=zsh --position=center --autoclose=2 ranger <CR>
map <leader>t :FloatermNew --height=0.8 --width=0.8 --wintype=floating --name=zsh --position=center <CR>

"                                                               run python code
"map <leader>r :FloatermNew --height=0.8 --width=0.8 --wintype=floating --name=zsh --position=center --autoclose=2 python3 % <CR>

"                create newline below current line without entering insert mode
nmap <CR> o<C-c>

"                                    go back to last opened file with backspace
nmap <BS> <C-^>
