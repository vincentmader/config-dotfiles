
" ╔═══════════════════════════════════════════════════════════════════════════╗
" ║                       $XDG_CONFIG_HOME/nvim/init.vim                      ║
" ╚═══════════════════════════════════════════════════════════════════════════╝

"                                     GENERAL
" =============================================================================

    "                                 General                               {{{
    " =========================================================================

    " Do NOT turn off all the improvements of "vi Improved" 
    " by ensuring "vi" compatibility.
      set nocompatible

    " Set encoding.
      set encoding=utf-8

    " Automatically reload files from disk on change.
      set autoread  

    " Restore last cursor position & marks on open.
      au BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
        \ |   exe "normal! g`\""
        \ | endif
    
    " }}}
    "                           General: Leader Keys                        {{{
    " =========================================================================
    " Define main leader key.
      let mapleader="\<space>"
    " Define local leader key.               TODO: What's the difference again?
      let maplocalleader ="\<tab>"

    " }}}
    "
    "                           Plugin Manager Setup                        {{{
    " =========================================================================
    " Make sure plugin manager (junnegun/vim-plug) is installed.
      if empty(glob('$XDG_CONFIG_HOME/nvim/autoload/plug.vim'))
          silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
      	\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
          autocmd VimEnter * PlugInstall --sync | source $NVIMRC
      endif

    " }}}
    "                           Plugin Installation                         {{{
    " =========================================================================

    " Activate "detection", "plugin", and "indent".
      filetype indent plugin on

    " Define list of plugins to install.
      call plug#begin('$XDG_CONFIG_HOME/nvim/plugged')


    " SYNTAX-HIGHLIGHTING, LINTING, & AUTO-COMPLETION
    " -------------------------------------------------------------------------

    " Synax Highlighting:
      " Plug 'vim-syntastic/syntastic'
      " Plug 'sheerun/vim-polyglot'
    " Highlight yanked portions of text.
      Plug 'machakann/vim-highlightedyank'
    " Colorize everything that has the format #rgb or #rrggbb.
      " Plug 'chrisbra/colorizer'
      " Plug 'norcalli/nvim-colorizer.lua'
    " Show indentation markers.
      " Plug 'yggdroot/indentline', {'for': ['python', 'javascript', 'tex', 'c', 'html']}

    " ALE:
      " Plug 'dense-analysis/ale'
      " Plug 'maximbaz/lightline-ale'

    " CoC Completion Engine:
      Plug 'neoclide/coc.nvim', {'branch': 'release'}   

    " SNIPPETS:
      " Plug 'SirVer/ultisnips'               (inactive, using CoC now instead)
      " Plug 'ycm-core/YouCompleteMe'         (inactive, using CoC now instead)
      " Plug 'honza/vim-snippets'


    " NAVIGATION                                    (file-to-file & intra-file)
    " -------------------------------------------------------------------------

    " Silver Searcher: Find files w/ c-string.
      Plug 'mileszs/ack.vim'

    " FZF: Fuzzy-File Search
      " TODO use telescope instead?
      Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': { -> fzf#install() } }
      Plug 'junegunn/fzf'
      " Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install --all' }
      " Plug 'yuki-ycino/fzf-preview.vim'   " TODO setup

    " NERDTree:
      Plug 'scrooloose/nerdtree'
      Plug 'jistr/vim-nerdtree-tabs'         " -> same NERDTree across vim-tabs
      Plug 'ivalkeen/nerdtree-execute'       " -> m-x in NERDTree to quick-open
      Plug 'Xuyuanp/nerdtree-git-plugin'     " -> git-status in NerdTree

    " Ranger:
      " Plug 'francoiscabrol/ranger.vim'

    " EasyMotion: vim motions on speed!
      " Plug 'easymotion/vim-easymotion'

    " Tags:
      " Plug 'vim-scripts/taglist.vim'
      " Plug 'ludovicchabant/vim-gutentags'


    " PROGRAMMING LANGUAGE SPECIFIC
    " -------------------------------------------------------------------------
    " - CoC took over a lot of the language-specific setup.

    " Python:
      " Plug 'jmcantrell/vim-virtualenv', {'for': 'python'}
      " Plug 'vim-scripts/indentpython.vim', {'for': 'python'}
      " Plug 'nvie/vim-flake8'                        

    " LaTeX:
      Plug 'lervag/vimtex', {'for': 'tex'}               
      " Plug 'brennier/quicktex', {'for': 'tex'}

    " Hypertext Markup Language:
      " Plug 'Valloric/MatchTagAlways', {'for': 'html'}

    " TOML:
      " Plug 'cespare/vim-toml'     

    " Markdown:
    " Enable markdown folding by section.
      Plug 'masukomi/vim-markdown-folding', {'for': 'markdown'}
    " Preview markdown                             
      " Plug 'kannokanno/previm'                     " -> automatic reloads (?)
    " Enable nicer tables                       
      " Plug 'dhruvasagar/vim-table-mode'          " ->  activate w/ <leader>tm
      " Plug 'coderifous/textobj-word-column.vim'


    " VERSION CONTROL
    " -------------------------------------------------------------------------

    " Fugitive:                    -> do everything git-related from inside vim
      Plug 'tpope/vim-fugitive'
    " Extension of fugitive, compatible.               TODO compatible w/ what?
      Plug 'gregsexton/gitv'                
    " Enable display of git status in sign-column.
      Plug 'airblade/vim-gitgutter'


    " TMUX
    " -------------------------------------------------------------------------

    " Make all words on screen available in auto-complete.
      Plug 'wellle/tmux-complete.vim'
    " Treat TMUX- & vim-panes equally.             -> navigate with c-a h/j/k/l
      Plug 'christoomey/vim-tmux-navigator' 


    " THEMES & GENERAL APPEARANCE
    " -------------------------------------------------------------------------

    " Solarized:
      Plug 'altercation/vim-colors-solarized'
      " Plug 'lifepillar/vim-solarized8'
      " Plug 'tomasiser/vim-code-dark'
      " Plug 'morhetz/gruvbox'
    " Devicons:
      Plug 'ryanoasis/vim-devicons'
 

    " MINIMALISM
    " -------------------------------------------------------------------------

    " Goyo: Clean up editor.
      Plug 'junegunn/goyo.vim'

    " LimeLight: Highlight only relevant sections.
      Plug 'junegunn/limelight.vim'


    " STATUS BAR
    " -------------------------------------------------------------------------

    " Airline:
      Plug 'vim-airline/vim-airline'
      Plug 'vim-airline/vim-airline-themes'
      " Plug 'edkolev/tmuxline.vim'


    " G.T.D.                                       (-> moved to Emacs Org-Mode)
    " -------------------------------------------------------------------------

      Plug 'mattn/calendar-vim', { 'for': 'vimwiki' }
      " Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
      " Plug 'BlindFS/vim-taskwarrior'
      " Plug 'tools-life/taskwiki', { 'for': 'vimwiki' }
      " Plug 'itchyny/calendar.vim'
      " Plug 'evansalter/vim-checklist'
      " Plug 'jceb/vim-orgmode'


    " VARIOUS
    " -------------------------------------------------------------------------

    " Floating Terminal:
      Plug 'voldikss/vim-floaterm'

    " UndoTree: Visualize undo-history in navigable tree.
      Plug 'mbbill/undotree'

    " Various nice plugins by tpope speeding up vim-workflow
      Plug 'tpope/vim-commentary'
      Plug 'tpope/vim-repeat'
      Plug 'tpope/vim-surround'
      Plug 'tpope/vim-speeddating'
      Plug 'tpope/vim-unimpaired'

    " Indentation based folding:
      " Plug 'tmhedberg/SimpylFold', {'for': 'python'}  
    " Faster folds:
      " Plug 'Konfekt/FastFold', {'for': 'python'}      

    " Unsorted:
      " Plug 'thalesmello/vim-textobj-multiline-str'
      " Plug 'rbgrouleff/bclose.vim'
      " Plug 'Konfekt/vim-CtrlXA'
      " Plug 'takac/vim-hardtime'
      " Plug 'greyblake/vim-esperanto'
      " Plug 'yuttie/comfortable-motion.vim'
      " Plug 'godlygeek/tabular'
      " Plug 'severin-lemaignan/vim-minimap' " not working TODO
      " Plug 'townk/vim-autoclose'
      " Plug 'vim-scripts/camelcasemotion'  " usage e.g.: ,w or ,b or ,e
    " No line numbers where they don't belong:
      " Plug 'myusuf3/numbers.vim'
    " Preview range, pattern and substitute:
      " Plug 'markonm/traces.vim'

    " Ideas:
      " matchit.vim 
      " snipmate.vim
      " a.vim
      
      call plug#end()
      
    " }}}

    "                          Appearance: Colorscheme                      {{{
    " =========================================================================

    " Specify name of colorscheme.
      colorscheme solarized

    " Enable dark-mode.
      set background=dark

    " Tell vim to use degraded colors.
    " - Needs to be active for solarized-black iTerm profile.  TODO [#B] Really?
    " - See: https://github.com/altercation/vim-colors-solarized#important-note-for-terminal-users
      " let g:solarized_termcolors=256                      

    " Define keyboard short-cuts to toggle light-/dark-mode.
    " -------------------------------------------------------------------------
    " Use light theme.
      map <leader>ml :set bg=light<CR>
    " Use dark theme.
      map <leader>md :set bg=dark<CR>

    " }}}
    "                            Appearance: Fonts                          {{{
    " =========================================================================

    " Use Hack Nerd in GUI-vim as well.
      set guifont="Hack Nerd Font"

    " }}}
    "                     Appearance: Syntax Highlighting                   {{{
    " =========================================================================

    " Turn on syntax highlighting. 
    " - NOTE: needs to be up here in file, to not conflict with SignCol
      syntax on
    
    " }}}
    "                           Appearance: Cursor                          {{{
    " =========================================================================
    
    " Always have at least 5 lines above/below cursor on screen.
      set scrolloff=12

    " Show on which line the cursor is by highlighting the whole row.
    " set cursorline

    " }}}
    "                         Appearance: Line Numbers                      {{{
    " =========================================================================
    " - Setup method of displaying line-numbers on the left side of the editor.

    " Use relative numbers in normal mode.
      set number relativenumber

    " Switch to absolute line numbering when in insert mode. 
      " augroup numbertoggle
      "     autocmd!
      "     autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
      "     autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
      " augroup END

    " Make background transparent.    TODO Why does this not affect the colors?
      " highlight LineNr ctermbg=None ctermfg=None
      " highlight LineNr ctermbg=red ctermfg=red    
    
    " }}}
    "                         Appearance: Miscellaneous                     {{{
    " =========================================================================
    
    " Show typed commands in lower-right corner of editor window.
    " - TODO: Change `ctermfg` for `showcmd` display-text. -> Green?
      set showcmd

    " Deactivate welcome text by setting its color to background.
    " - NOTE: Welcome text is deactivated anyways. -> Not needed anymore.
      autocmd BufEnter * :highlight NonText guifg=bg<CR>
    " - TODO: Now the message is there again. EVEN if I re-activate above...???

    " }}}
    "
    "                                  Macros                               {{{
    " ========================================================================= 

    " Define shortcut to execute last executed macro.
      nnoremap Q @@

    " Only redraw screen after macro is finished -> speed-up.
      set lazyredraw

    " Remap yanking until end of line.
      " nnoremap Y y$

" }}}
    "                         Navigation inside Files                       {{{
    " =========================================================================

    " Activate mouse.
      set mouse=a  

    " Move vertically by visual line.
      nnoremap j gj
      nnoremap k gk

    " Confiure Intra-file Search.                                 (-> with "/")
    " -------------------------------------------------------------------------
    " Search incrementally as characters are entered, & highlight matches.
      set incsearch hlsearch
    " Make case-insensitive, except if capital letters are entered explicitly.
      set ignorecase smartcase

    " }}}
    "                         Navigation between Files                      {{{
    " =========================================================================

    " Buffers
    " -------------------------------------------------------------------------
    " Switch between buffers.                  (Re-map: Use buffers, not tabs!)
      map gn :bn<cr>
      map gp :bp<cr>
    " map gd :bd<cr> 

" }}}
    "                                Vim-Modes                              {{{
    " =========================================================================

    " Quick-exit insert mode with `jk`, and write to file.
      inoremap jk <Esc>:w<cr>

    " Quick-exit vim.
      map zz :wq!<CR>

" }}}
"

    "                           Sign & Color Columns                        {{{
    " =========================================================================

    " SIGN COLUMN:                                                       (left)
    " -------------------------------------------------------------------------
    " Always display sign-column where error symbols would be displayed.
      set signcolumn=yes
      highlight clear SignColumn
      highlight SignColumn ctermfg=none ctermbg=none guifg=none guibg=none
      "               ^ does nothing

    " COLOR COLUMN:                                                     (right)
    " -------------------------------------------------------------------------
    " - deactivated a.t.m.

    " Method a: Display color-column to signify the 81st column.
      " set textwidth=80
      " set colorcolumn=81
      " highlight ColorColumn ctermbg=235

    " Method b: Color text after column 80 in e.g. red.
      " au BufEnter *.wiki let b:is_wiki_file=1
      " au BufEnter *.vimwiki let b:is_wiki_file=1
      " if !exists("b:is_wiki_file")
      "     " echo exists("b:is_wiki_file")
      "     " echo b:is_wiki_file
      "     autocmd BufEnter * match Error /\%>80c/
      " endif

" }}}
"                                  Status Bar                               {{{
" =============================================================================

" =============================================================================
"                                   Theme
" =============================================================================

    "  Use Solarized theme.
      let g:airline_theme = 'solarized' 

    " Use dark background.
      let g:airline_solarized_bg = 'dark'

" =============================================================================
"                                  Tab-Bar
" =============================================================================

    " Activate tab-line extension.
      let g:airline_extensions = ["tabline"]                

    " Turn off triangle thingies.
      let g:airline_right_sep=''
    " let g:airline_left_sep=''

    " Use dark text in file-name (at left end of airline).
      let g:airline_solarized_dark_text = 1

    " Customize Colors of...                                  (for vanilla-vim)
    " ...selected tab:
    " hi TabLineSel ctermfg=Red ctermbg=Yellow
    " ...unselected tab:
    " hi TabLineFill ctermfg=LightGreen ctermbg=DarkGreen
    " ...background of tabline:
    " hi TabLine ctermfg=Blue ctermbg=Yellow
    " ...window counter per tab (?)
    " hi Title ctermfg=LightBlue ctermbg=Magenta

    " Make tab-bar bg invisible/black
      augroup HITABFILL
          autocmd!
          " Change `airline_tabfill` colors to black/transparent.
          autocmd User AirlineAfterInit hi airline_tabfill ctermbg=black ctermfg=none

          " The following options don't seem to affect status-bar colors... (?)
          " autocmd User AirlineAfterInit hi airline_tabfill_to_airline_tabfill ctermbg=black ctermfg=none
          " autocmd User AirlineAfterInit hi airline_tabhid_to_airline ctermbg=black ctermfg=none
          " autocmd User AirlineAfterInit hi airline_tabfill_to_airline_tablabel_right ctermbg=None ctermfg=red
          " autocmd User AirlineAfterInit hi airline_tabfill_to_airline_tabfill ctermbg=None ctermfg=red
          " autocmd User AirlineAfterInit hi airline_tab_right ctermbg=None ctermfg=red
          " autocmd User AirlineAfterInit hi airline_tabtype ctermbg=None ctermfg=red
      augroup END

" =============================================================================
"                                 Status-Bar
" =============================================================================

" Deactivate default vim status-line.
" -----------------------------------------------------------------------------

    " Don't show vim-mode.
      set noshowmode 
    " Don't show current location in file.
      set noruler    
    " Set colors of statusline. (invisible)
      hi StatusLine ctermbg=None ctermfg=black

" Disable airline statusline.
" -----------------------------------------------------------------------------

    " Disable statusline. (makes the following lines obsolete)
      let w:airline_disable_statusline = 1

" Configure statusline                              (obsolete, bc. deactivated)
" -----------------------------------------------------------------------------

    " Move status-line to bottom of editor window.
    " let g:airline_statusline_ontop = 0

    " Disable display of mode.
    " let g:airline_section_a = ''

    " Disable display of version control info.
    " let g:airline_section_b = ''

    " Disable display of file-name.
    " let g:airline_section_c = ''

    " Disable display of file-type.
    " let g:airline_section_x = ''

    " Disable display of file-encoding.
    " let g:airline_section_y = ''

    " Disable display of location in file.
    " let g:airline_section_z = ''
    " let g:airline_section_z = '%3p%% %3l/%L:%3v'

    " Skip empty sections. (-> less separator-triangle thingies)
    " let g:airline_skip_empty_sections = 1

    " Configure default expected file-encoding 
    " let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
    "  ^ -> file-encoding not displayed for utf-8 

" =============================================================================
" |                                 TMUX-Bar                                  |
" =============================================================================

    " Apply same theme for TMUX statusbar.                        (deactivated)
    " let g:tmuxline_preset = {
    "     \'a'    : '#S',
    "     \'b'    : '',
    "     \'c'    : '',
    "     \'win'  : '#I #W',
    "     \'cwin' : '#I #W',
    "     \'x'    : '',
    "     \'y'    : '%a %d, %R',
    "     \'z'    : ''}

" =============================================================================
"                               Command-Bar/Line                              |
" =============================================================================

    " prevent vim from printing welcome message.   (todo: move, tgth. w/ below)
      set shortmess=I
    " prevent Vim from echoing the current filename into the commandline.
      set shortmess+=F

" =============================================================================
" |                                 Various                                   |
" =============================================================================

    " Use powerline fonts.
      let g:airline_powerline_fonts = 1

    " Display CoC-info in statusbar.
      let g:airline#extensions#coc#enabled = 1

    " Deactivate tabline-labels for buffers & tabs.
      let g:airline#extensions#tabline#tabs_label = ''
      let g:airline#extensions#tabline#buffers_label = ''

    " let g:airline_solarized_normal_green = 1
    " let g:airline_solarized_dark_inactive_border = 1
    " let g:airline#extensions#tabline#show_splits = 0
    " let g:airline#extensions#tabline#show_buffers = 1
    " let g:airline#extensions#tabline#show_tabs = 1
    " let airline_solarized_enable_command_color = 1

    " Use cache (should speed up vim).
    " let g:airline_highlighting_cache = 0

" }}}
"                               Syntax Highlighting                         {{{
" =============================================================================

     " Highlight matching brackets for (), [], {}, and <>   
    " - NOTE: Switch between them with %
      set showmatch
      set matchpairs+=<:>

    " Use colorizer pugin to display RGBA hex-codes in corresponding color.
      " autocmd BufEnter * :ColorHighlight <CR>
      " lua require'colorizer'.setup()

    " Flag erroneous whitespace.
    " au BufRead, BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

    " Show indentation markers.
    " NOTE: todo

" }}}
"                                  Transparency                             {{{
" =============================================================================
    " TODO: Clean up!

    " Deactivate tildes on the left side of the screen
      highlight Normal guibg=None ctermbg=None  
      highlight EndOfBuffer guifg=None ctermfg=0 ctermbg=none

    " TODO: What do these do? 
    " highlight Normal guibg=None ctermbg=None  
    " highlight Normal ctermfg=None ctermbg=000000
    " highlight Normal ctermfg=None ctermbg=None
    " hi Normal guibg=none ctermbg=NONE
    " hi NonText guibg=green ctermbg=NONE
    " hi Cursor guibg=red ctermbg=NONE
    " hi ErrorMsg guibg=orange ctermbg=NONE
    " hi Normal guibg=NONE
    " hi NonText guibg=NONE
    " hi ModeMsg guibg=NONE
    " hi MoreMsg guibg=NONE
    " hi ModeArea guibg=NONE
    " hi ErrorMsg guibg=NONE
    " hi Error guibg=NONE
    " hi Directory guibg=NONE
    " hi VertSplit guibg=NONE
    " hi SignColumn ctermbg=red
    " hi EndOfBuffer guibg=NONE
    " hi NormalFloat guibg=NONE
    " hi Folded guibg=NONE
    " highlight Insert ctermfg=None ctermbg=None

" }}}
"                             Code Collapsing & Folds                       {{{
" =============================================================================

    " Enable folding.
      set foldmethod=manual
    " Fold all on file-open.
      set foldlevel=99
    " Make vim-folds less awful-looking.
      highlight clear Folded
    " Remove dots.
      set fillchars=fold:\     

    " Preview docstrings in folded mode.
    " let g:SimpylFold_docstring_preview = 1        
    " let g:SimpylFold_fold_docstring=0
    " " don't fold import statements
    " let g:SimpylFold_fold_import=0              
    
    " Nicer folding.
    " function! NeatFoldText()
    "     let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
    "     let lines_count = v:foldend - v:foldstart + 1
    "     let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
    "     let foldchar = matchstr(&fillchars, 'fold:\zs.')
    "     let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
    "     let foldtextend = lines_count_text . repeat(foldchar, 8)
    "     let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
    "     return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
    " endfunction
    " set foldtext=NeatFoldText()

" }}}

"                            General Vim Configuration                      {{{
" =============================================================================


    " Increase :cmdline history size.
      set history=1000                            
      au FocusGained,BufEnter * :checktime

    " allow backspace in insert mode
        " set backspace=indent,eol,start  

    " Configure buffers to be able to exist in background.
      set hidden  
    
    " Copy & paste to system clipboard.
        if has('clipboard')
            set clipboard=unnamed
            if has('unnamedplus')  " X11 support
                set clipboard+=unnamedplus
            endif
        endif
        vnoremap <C-c> :w !pbcopy<CR><CR>
        noremap <C-v> :r !pbpaste<CR><CR>
    
    " Define default indentation settings.
      set softtabstop=4
      set shiftwidth=4
      set expandtab
      set autoindent
    
    " Disable wrapping for long lines.
      set nowrap
      set formatoptions-=t

    " Enable autocomment on newline.
      set formatoptions+=r
        
    " Remove trailing whitespaces.
      command! FixWhitespace :%s/\s\+$//e
    
    if expand('%:e')=='tera'
        set syntax=html
    endif

" }}}
"                               TODO                           {{{
" =============================================================================

    " TODO: What does this do? Do I need it?
    hi Pmenu ctermfg=Black ctermbg=White guifg=Black guibg=White
    hi PmenuSel ctermfg=White ctermbg=Black guifg=White guibg=Black

    " TODO: What does this do? Do I need it?
    " augroup colorscheme_coc_setup | au!
    "     au ColorScheme * call s:my_colors_setup()
    " augroup END
    
    " TODO: What does this do? Do I need it?
    " setlocal cole=1
    
    " Turn off indent lines by default.
    " autocmd BufEnter * IndentLinesDisable

    " This color is used by solarized for comments.
      let g:limelight_conceal_ctermfg = "239"  
    
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
      map <Leader>czsh :tabnew $ZSHRC <CR>
      map <Leader>cali :tabnew $XDG_CONFIG_HOME/shell/aliasrc <CR>
    " Suckless DWM
      map <Leader>cdwm :tabnew $XDG_CONFIG_HOME/dwm/config.h <CR>
    " Suckless Terminal
      map <Leader>cst :tabnew $XDG_CONFIG_HOME/st/config.h <CR>
    " TMUX
      map <Leader>ctmx :tabnew $HOME/.tmux.conf <CR>
    " XOrg
      map <Leader>cxrc :tabnew $XINITRC <CR>
      map <Leader>cxrc :tabnew $XDG_CONFIG_HOME/x/xinitrc <CR>

" }}}
"                                Quick-Move Lines                           {{{
" ============================================================================= 

    " TODO Add description.
      nnoremap <leader>k :m-2<cr>==
      xnoremap <leader>k :m-2<cr>gv=gv
      nnoremap <leader>j :m+<cr>==
      xnoremap <leader>j :m'>+<cr>gv=gv

" }}}
"                                 Version Control                           {{{
" ============================================================================= 

    " Add, commit, & push.
      map <Leader>va :Git add %<CR>
      map <Leader>vc :Git commit<CR>
      map <Leader>vp :Git push<CR>

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
"                                           searching and switching buffers {{{
" =============================================================================

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
"                                Version Control                            {{{ 
" =============================================================================

    " Backup & Swap
    " -------------------------------------------------------------------------
    " Turn off swap files.
      set noswapfile
    " Turn off backup.
      set nobackup
      set nowritebackup
    
    " Vim Undo
    " ------------------------------------------------------------------------
      " Save undo-history across sessions, by storing in file. 
      if has('persistent_undo')
          silent !mkdir $HOME/.config/nvim/backups > /dev/null 2>&1
          set undodir=$HOME/.config/nvim/backups
          set undofile
      endif
    
    " Git
    " -------------------------------------------------------------------------
    " TODO: setup

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

"                                    PLUGINS
" =============================================================================

"                                ag/silver searcher (find file by c-string) {{{
" =============================================================================
" use the silver searcher (a.k.a. ag) instead of ack (only if installed)
if executable('ag')
    let g:ackprg = 'ag --nogroup --nocolor --column'
endif
nnoremap <leader>a :Ack! -Q ""<Left>

" }}}
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
"                                       FZF                                 {{{
" =============================================================================

      let g:fzf_action = {
        \ 'ctrl-t': 'tab split',
        \ 'ctrl-x': 'split',
        \ 'ctrl-v': 'vsplit' 
        \ }
      
      let g:fzf_colors =
      \ { 'fg':      ['fg', 'Normal'],
        \ 'bg':      ['bg', 'Normal'],
        \ 'hl':      ['fg', 'Comment'],
        \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
        \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
        \ 'hl+':     ['fg', 'Statement'],
        \ 'info':    ['fg', 'PreProc'],
        \ 'border':  ['fg', 'Ignore'],
        \ 'prompt':  ['fg', 'Conditional'],
        \ 'pointer': ['fg', 'Exception'],
        \ 'marker':  ['fg', 'Keyword'],
        \ 'spinner': ['fg', 'Label'],
        \ 'header':  ['fg', 'Comment'] 
        \ }
      
      " set rtp+=/usr/local/opt/fzf
      " set rtp+=~/.fzf
      " command! -bang -nargs=* Find call fzf#vim#grep('rg --column --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)" split/vsplit settings
      
    " floating fzf
      " let g:fzf_layout = { 'window': 'call FloatingFZF()' }
      " function! FloatingFZF()
      "   let buf = nvim_create_buf(v:false, v:true)
      "   call setbufvar(buf, '&signcolumn', 'no')
      
      "   let height = float2nr(30)
      "   let width = float2nr(60)
      "   let horizontal = float2nr((&columns - width) / 2)
      "   let vertical = 1
      
      "   let opts = {
      "         \ 'relative': 'editor',
      "         \ 'row': vertical,
      "         \ 'col': horizontal,
      "         \ 'width': width,
      "         \ 'height': height,
      "         \ 'style': 'minimal'
      "         \ }
      
      "   call nvim_open_win(buf, v:true, opts)
      " endfunction

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
"                               Goyo & LimeLight                            {{{
" ============================================================================= 

    " Goyo
    " -------------------------------------------------------------------------
      nmap <Leader>g :Goyo<CR>
      xmap <Leader>g :Goyo<CR>

    " LimeLight
    " -------------------------------------------------------------------------
      function MinimalistSetupEnable()
          " Limelight!
          set nonumber norelativenumber
      endfunction
      autocmd! User GoyoEnter call MinimalistSetupEnable()

      function MinimalistSetupDisable()
          " Limelight!
          set number relativenumber
          quit
          " source $XDG_CONFIG_HOME/nvim/init.vim
      endfunction
      autocmd! User GoyoLeave call MinimalistSetupDisable()

      nmap <Leader>l :Limelight!!<CR>
    " nmap <Leader>l <Plug>(Limelight)
    " xmap <Leader>l <Plug>(Limelight)
    " let g:limelight_bop = '^\s'
    " let g:limelight_eop = '\ze\n^\s'
    " let g:limelight_paragraph_span = 2

" }}}
"                         NERDTree (visual file manager)                    {{{
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
    
" }}}
"                                                                    ranger {{{
" =============================================================================
" deactivate default mapping (<leader>f)
let g:ranger_map_keys = 0 
" change default ranger command
let g:ranger_command_override = 'ranger --confdir=$XDG_CONFIG_HOME/ranger'

" }}}
"                                   TaskWarrior                             {{{
" =============================================================================

    " NOTE: very messy

    " Taskwarrior
    " highlight taskwarrior_priority ctermbg=white ctermfg=green 
    " let g:task_highlight_field=0
    " let g:task_readonly=0
    
    " todoCheckbox
    " if exists("b:current_syntax")
    "   finish
    " endif
    
    " Custom conceal
    " syntax match todoCheckbox "\[\ \]" conceal cchar=
    " syntax match todoCheckbox "\[X\]" conceal cchar=
    " syntax match todoCheckbox "- \[\ \]" conceal cchar=
    " syntax match todoCheckbox "- \[X\]" conceal cchar=
    " syntax match todoCheckbox "* \[\ \]" conceal cchar=
    " syntax match todoCheckbox "* \[X\]" conceal cchar=
    " let b:current_syntax = "todo"
    
    " hi def link todoCheckbox Todo
    " hi Conceal guibg=NONE

" }}}
"                              TaskWarrior & VimWiki                        {{{
" ============================================================================= 
    " NOTE: Deactivated.

    " nnoremap <leader>t :tabnew <bar> :TW<CR>
    " map <leader>x :ChecklistToggleCheckbox<CR>
    " map <leader>y :CalendarH<CR>

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

" =============================================================================

"                                       SORT                                {{{
" =============================================================================

      " source $XDG_CONFIG_HOME/nvim/ale.vim
      " source $XDG_CONFIG_HOME/nvim/gtd.vim
      
      " autocmd vimenter * FZF
      
      " set concealcursor=nc
  
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
  
      " calendar
      " let g:calendar_frame = 'default'

" }}}

    "                                  Title                                {{{
    " =========================================================================
    
    " }}}


      set nowrap

