
" -----------------------------------------------------------------------------
"                                   KEY REMAPS
" -----------------------------------------------------------------------------

"                                Switching Themes                           {{{
" ============================================================================= 

    " Use light theme.
      map <leader>ml :set bg=light<CR>
    " Use dark theme.
      map <leader>md :set bg=dark<CR>

" }}}
"                               Goyo & LimeLight                            {{{
" ============================================================================= 

    " Goyo
    " -------------------------------------------------------------------------
      nmap <Leader>g :Goyo<CR>
      xmap <Leader>g :Goyo<CR>

    " LimeLight
    " -------------------------------------------------------------------------
    " autocmd! User GoyoEnter Limelight
      function MinimalistSetupDisable()
          Limelight!
          highlight clear SignColumn
          source $XDG_CONFIG_HOME/nvim/appearance.vim
      endfunction
      autocmd! User GoyoLeave call MinimalistSetupDisable()
      nmap <Leader>l :Limelight!!<CR>
    " nmap <Leader>l <Plug>(Limelight)
    " xmap <Leader>l <Plug>(Limelight)
    " let g:limelight_bop = '^\s'
    " let g:limelight_eop = '\ze\n^\s'
    " let g:limelight_paragraph_span = 2

" }}}
"                             Quick-Open Config Files                       {{{
" ============================================================================= 

    " NeoVim
      map <Leader>cvim :tabnew $XDG_CONFIG_HOME/nvim/init.vim <CR>
      command! -nargs=? Ftedit execute "tabe $XDG_CONFIG_HOME/nvim/ftplugin/" . ("<args>" == "" ? &filetype : "<args>") . ".vim"
      map <Leader>cvft :Ftedit <CR>
      map <Leader>ccoc :CocConfig <CR>
      map <leader>csnp :CocCommand snippets.openSnippetFiles <CR>
    " Pylint
    " map <Leader>cpl :tabnew ~/.pylintrc <CR>
    " QuteBrowser
      map <leader>cqtb :tabnew $XDG_CONFIG_HOME/qutebrowser/config.py <CR>
    " Shell/Zsh
      map <Leader>cali :tabnew $XDG_CONFIG_HOME/zsh/aliasrc <CR>
      map <Leader>cxrc :tabnew $XINITRC <CR>
      map <Leader>czsh :tabnew $ZSHRC <CR>
      map <Leader>cxrc :tabnew $XDG_CONFIG_HOME/x/xinitrc <CR>
    " Suckless DWM
      map <Leader>cdwm :tabnew $XDG_CONFIG_HOME/dwm/config.h <CR>
    " Suckless Terminal
      map <Leader>cst :tabnew $XDG_CONFIG_HOME/st/config.h <CR>
    " TMUX
      map <Leader>ctmx :tabnew $HOME/.tmux.conf <CR>

" }}}
"                                Quick-Move Lines                           {{{
" ============================================================================= 

    " TODO Add description.
      nnoremap <leader>k :m-2<cr>==
      xnoremap <leader>k :m-2<cr>gv=gv
      nnoremap <leader>j :m+<cr>==
      xnoremap <leader>j :m'>+<cr>gv=gv

" }}}
"                              In-File Navigation                           {{{
" ============================================================================= 

    " Switch between editor modes.
    " -------------------------------------------------------------------------
    " Quick-exit insert mode with `jk`, and write to file.
      inoremap jk <Esc>:w<cr>
    " Quick-exit vim.
      map zz :wq!<CR>
    
    " Switch between buffers.
    " -------------------------------------------------------------------------
    " Use buffers, not tabs.
      map gn :bn<cr>
      map gp :bp<cr>
    " map gd :bd<cr> 

" }}}
"                                    FuzzyFind                              {{{
" ============================================================================= 

    " Fuzzy Find
    " -------------------------------------------------------------------------
    " Use <leader>f to open fuzzy finder.
    " - NOTE: Type ' next for exact search.
      nnoremap <silent> <leader>f :FZF <CR>
    " nnoremap <silent> <leader>f :FzfPreviewDirectoryFiles <CR>
    " nnoremap <silent> <leader>fg :FzfPreviewProjectFiles<CR>
    " nnoremap <silent> <leader>fb :FzfPreviewBuffers<CR>
    " nnoremap <silent> <leader>fc :Commits<CR>
    " nnoremap <silent> <leader>fbc :BCommits<CR>
    " nnoremap <silent> <leader>fs :Snippets<CR>
    " Search files by content.
    " nnoremap <silent> <leader>ff :Rg<CR>  
    " Fuzzy Find Flags:
    " --column: Show column number
    " --line-number: Show line number
    " --no-heading: Do not show file headings in results
    " --fixed-strings: Search term as a literal string
    " --ignore-case: Case insensitive search
    " --no-ignore: Do not respect .gitignore, etc...
    " --hidden: Search hidden files and folders
    " --follow: Follow symlinks
    " --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
    " --color: Search color options

" }}}
"                                     Macros                                {{{
" ============================================================================= 

    " Execute last executed macro.
      nnoremap Q @@

    " Only redraw screen after macro is finished -> speed-up.
      set lazyredraw

    " Remap yanking until end of line.
    " nnoremap Y y$

" }}}
"                                 Version Control                           {{{
" ============================================================================= 

    " Add, commit, & push.
      map <Leader>va :Git add %<CR>
      map <Leader>vc :Git commit<CR>
      map <Leader>vp :Git push<CR>

" }}}
"                              TaskWarrior & VimWiki                        {{{
" ============================================================================= 
    " NOTE: Deactivated.

    " nnoremap <leader>t :tabnew <bar> :TW<CR>
    " map <leader>x :ChecklistToggleCheckbox<CR>
    " map <leader>y :CalendarH<CR>

" }}}
"                                     Various                               {{{
" ============================================================================= 

    " Source vim config.
      map <leader>rcv :source $XDG_CONFIG_HOME/nvim/init.vim<CR>

    " Open UndoTree.
      map <leader>u :UndotreeToggle <CR>
    
    " Open NerdTree.
      map <leader>nt :NERDTreeTabsToggle<CR>

    " Create newline below current line without entering insert mode.
      nmap <CR> o<C-c>

    " Go back to last opened file with backspace.
      nmap <BS> <C-^>

    " Reload current file from disk.
    " map <M-r> :e % <CR>
    "
    " Check spelling. (Orthography?)
    " map <leader>o: :setlocal spell! spelllang=en_US<CR>

    " Sort (?)
    " map <Leader>ss :sort<CR>

    " Re-Maps
    " -------------------------------------------------------------------------
    " Turn off search match highlighting.
      nnoremap <leader>/ :nohlsearch<CR>

    " Floating Terminal
    " -------------------------------------------------------------------------
    " Open terminal in vim.
    " nnoremap <silent> <leader>sh :terminal<CR>
    " Open floating terminal in vim.
      map <leader>ot :FloatermNew --height=0.8 --width=0.8 --wintype=floating --name=zsh --position=center<CR>
    " Open floating terminal and run ranger.
    " map <leader>or :Ranger<CR>
    " map <leader>r :FloatermNew --height=0.8 --width=0.8 --wintype=floating --name=zsh --position=center --autoclose=2 ranger <CR>
    " Open floating terminal and run python script.
    " map <leader>r :FloatermNew --height=0.8 --width=0.8 --wintype=floating --name=zsh --position=center --autoclose=2 python3 % <CR>


    " Date Formatting
    " -------------------------------------------------------------------------
    " Paste date-string.
      map <Leader>sfd :pu=strftime('%Y-%m-%d')<CR>
    " Paste time-string.
      map <Leader>sft :pu=strftime('%H:%M:%S')<CR>

" }}}
