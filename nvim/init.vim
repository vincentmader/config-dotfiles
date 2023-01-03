
" ╔═══════════════════════════════════════════════════════════════════════════╗
" ║                       $XDG_CONFIG_HOME/nvim/init.vim                      ║
" ╚═══════════════════════════════════════════════════════════════════════════╝

"                                                                       GENERAL
" ═════════════════════════════════════════════════════════════════════════════
"                                    GENERAL:                               {{{
" ═════════════════════════════════════════════════════════════════════════════

"   Do NOT ensure "vi" compatibility (since it would turn off "vim" features).
    set nocompatible

"   Set encoding.
    set encoding=utf-8

"   Automatically reload files from disk on change.
    set autoread  

" }}} ═════════════════════════════════════════════════════════════════════════
"                                GENERAL: Buffers                           {{{
" ═════════════════════════════════════════════════════════════════════════════

"   Configure buffers to be able to exist in background.
    set hidden  

" }}} ═════════════════════════════════════════════════════════════════════════
"                            GENERAL: Editing History                       {{{ 
" ═════════════════════════════════════════════════════════════════════════════
 
"   Restore last cursor position & marks on open.
    au BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | endif

"   Increase :cmdline history size.
    set history=1000                            
    au FocusGained,BufEnter * :checktime

"   Save undo-history across sessions, by storing in file. 
    if has('persistent_undo')
        silent !mkdir "$XDG_DATA_HOME/nvim/backups" > /dev/null 2>&1
        set undodir="$XDG_DATA_HOME/nvim/backups"
        set undofile
    endif

"   Turn off swap files.
    set noswapfile

"   Turn off backup.
    set nobackup
    set nowritebackup

"   Turn off writing of shared-data files.
    set viminfo+=n~/.local/share/nvim/shada/main.shada"       
"              ^ Do NOT get rid of this line, 
"                it took me hours to figure this out...
"                Without it, `nvim/shada/main.shada` is created EVERYWHERE...
"                (...where nvim is started.)
"   See below for my other attempts:
"   1. This should be working, 
"      after all I AM talking about nvim's `shada`, not vim's `viminfo`,
"      but:  -> NOT working!
  " set shadafile="~/.local/share/nvim/shada/main.shada"
"      Maybe because of the apostrophes?
"      Or because there is no `+=`?
"      Or because of the missing `n`?
"   2. But then at least this should be working, 
"      since it is the same as the solution above, only using shell-variables,
"      but:  -> NOT working!
  " set viminfo+="$XDG_DATA_HOME/nvim/shada/main.shada"
"   3. I tried around with a lot of other things as well...
"      but:  ->  NOT working!
  " set shadafile="NONE"
  " set shada="$XDG_DATA_HOME/nvim/shada"
  " set shada="~/.cache/nvim"
  " set shada='1000
"   In the end, if all else fails, 
"   one can always just deactivate writing to SHADA entirely:
  " set shada="NONE"
  " set viminfo="NONE"

" }}} ═════════════════════════════════════════════════════════════════════════
"                             GENERAL: File Types                           {{{
" ═════════════════════════════════════════════════════════════════════════════

"   Configure `.tera` files to be handled as if they were `.html` files.
    if expand('%:e')=='tera'
        set syntax=html
    endif

" }}} ═════════════════════════════════════════════════════════════════════════
"                             GENERAL: Leader Keys                          {{{
" ═════════════════════════════════════════════════════════════════════════════
"   TODO Look-up: What's the difference again btw. "leader" & "local-leader"?

"   Define (main/gobal) leader key.
    let mapleader="\<space>"

"   Define local leader key.               
    let maplocalleader ="\<tab>"

" }}} ═════════════════════════════════════════════════════════════════════════
"                               GENERAL: Vim Config                         {{{
" ═════════════════════════════════════════════════════════════════════════════

"   Source vim config.
"   TODO: Fix: This currently leads to weird behavior.
  " map <leader>rcv :source $XDG_CONFIG_HOME/nvim/init.vim<CR>

" }}} ═════════════════════════════════════════════════════════════════════════
"                               GENERAL: Vim Modes                          {{{
" ═════════════════════════════════════════════════════════════════════════════

"   Quick-exit insert mode with `jk`, & write to file.
"   NOTE: Optionally add one more <CR> to circumvent annoying 
"         message "Press ENTER or type command to continue".
    inoremap jk <Esc>:silent w<cr>

"   Quick-exit vim.
  " map zz :wq!<CR>

" }}} ═════════════════════════════════════════════════════════════════════════
"                             GENERAL: Window-Splits                        {{{
" ═════════════════════════════════════════════════════════════════════════════
" NOTE: Unused at the moment. -> Using TMUX splits instead.

"   Configure new vim window-splits to go to the right & below.
    set splitbelow
    set splitright

"   Navigate vim splits via `C-hjkl`.
    nnoremap <C-H> <C-W><C-H>
    nnoremap <C-J> <C-W><C-J>
    nnoremap <C-K> <C-W><C-K>
    nnoremap <C-L> <C-W><C-L>

" }}} ═════════════════════════════════════════════════════════════════════════
"                                    GENERAL: ...                           {{{

" }}} ═════════════════════════════════════════════════════════════════════════
"                                                                PLUGIN MANAGER
" ═════════════════════════════════════════════════════════════════════════════
"                                 PLUGINS:                                  {{{
" ═════════════════════════════════════════════════════════════════════════════

"   Activate "filteype detection", "plugin", and "indent".
    filetype on
    filetype plugin on
    filetype indent on

" }}} ═════════════════════════════════════════════════════════════════════════
"                             PLUGINS: Plugin Manager                       {{{
" ═════════════════════════════════════════════════════════════════════════════

"   Make sure plugin manager (junnegun/vim-plug) is installed.
    if empty(glob("$XDG_DATA_HOME/nvim/site/autoload/plug.vim"))
        silent !curl -fLo 
        \ "$XDG_DATA_HOME/nvim/site/autoload/plug.vim" --create-dirs
    	\ "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    endif

"   Auto-install plugins.
    if empty(glob("$XDG_DATA_HOME/nvim/plugged"))
        autocmd VimEnter * PlugInstall --sync | source $NVIMRC
    endif

" }}} ═════════════════════════════════════════════════════════════════════════
"                         PLUGINS: Plugin List Definition                   {{{
" ═════════════════════════════════════════════════════════════════════════════

"   Define list of plugins to install.
    call plug#begin('$XDG_DATA_HOME/nvim/plugged')

"   SYNTAX-HIGHLIGHTING
"   ───────────────────────────────────────────────────────────────────────────

"       Highlight yanked portions of text.
        Plug 'machakann/vim-highlightedyank'

"       Colorize everything that has the format #rgb or #rrggbb.
      " Plug 'chrisbra/colorizer'
      " Plug 'norcalli/nvim-colorizer.lua'

"       Show indentation markers.
      " Plug 'yggdroot/indentline', {'for': ['python', 'javascript', 'tex', 'c', 'html']}

"       Various
      " Plug 'vim-syntastic/syntastic'
      " Plug 'sheerun/vim-polyglot'

"   LINTING & AUTO-COMPLETION
"   ───────────────────────────────────────────────────────────────────────────

"       CoC Completion Engine
        Plug 'neoclide/coc.nvim', {'branch': 'release'}   

"       ALE
      " Plug 'dense-analysis/ale'
      " Plug 'maximbaz/lightline-ale'

"   SNIPPETS
"   ───────────────────────────────────────────────────────────────────────────

      " Plug 'SirVer/ultisnips'               (inactive, using CoC now instead)
      " Plug 'ycm-core/YouCompleteMe'         (inactive, using CoC now instead)
      " Plug 'honza/vim-snippets'
      " snipmate.vim

"   NAVIGATION                                    (file-to-file & intra-file)
"   ───────────────────────────────────────────────────────────────────────────

"       Silver-searcher: Find files w/ c-string.
        Plug 'mileszs/ack.vim'

"       Fuzzy-Find File Search
"       TODO: Think re: Use telescope instead?
        " Plug 'junegunn/fzf', { 'dir': '~/.config/fzf', 'do': { -> fzf#install() } }
        " Plug 'junegunn/fzf'
      " Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install --all' }
      " Plug 'yuki-ycino/fzf-preview.vim'   " TODO setup
      " Plug 'yuki-yano/fzf-preview.vim'   " TODO setup
      " Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }

"       Telescope (FZF replacement)
        Plug 'nvim-lua/plenary.nvim'
        Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
        Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
        Plug 'cljoly/telescope-repo.nvim'

"       NERDTree
        Plug 'scrooloose/nerdtree'
        Plug 'jistr/vim-nerdtree-tabs'         " -> same NERDTree across vim-tabs
        Plug 'ivalkeen/nerdtree-execute'       " -> m-x in NERDTree to quick-open
        Plug 'Xuyuanp/nerdtree-git-plugin'     " -> git-status in NerdTree

"       Ranger
      " Plug 'francoiscabrol/ranger.vim'

"       EasyMotion (vim motions on speed!)
      " Plug 'easymotion/vim-easymotion'

"       Tags
      " Plug 'vim-scripts/taglist.vim'
      " Plug 'ludovicchabant/vim-gutentags'

"   PROGRAMMING LANGUAGE SPECIFIC
"   -------------------------------------------------------------------------
"   - CoC took over a lot of the language-specific setup.

"       Python
      " Plug 'jmcantrell/vim-virtualenv', {'for': 'python'}
      " Plug 'vim-scripts/indentpython.vim', {'for': 'python'}
      " Plug 'nvie/vim-flake8'                        

"       LaTeX
        Plug 'lervag/vimtex', {'for': 'tex'}               
      " Plug 'brennier/quicktex', {'for': 'tex'}

"       Hypertext Markup Language
      " Plug 'Valloric/MatchTagAlways', {'for': 'html'}

"       TOML
      " Plug 'cespare/vim-toml'     

"       Markdown
"       Enable markdown folding by section.
        Plug 'masukomi/vim-markdown-folding', {'for': 'markdown'}
"       Preview markdown                             
      " Plug 'kannokanno/previm'                   " -> automatic reloads (?)
"       Enable nicer tables                       
      " Plug 'dhruvasagar/vim-table-mode'        " ->  activate w/ <leader>tm
      " Plug 'coderifous/textobj-word-column.vim'

"   VERSION CONTROL
"   -------------------------------------------------------------------------

"       Fugitive                 -> do everything git-related from inside vim
        Plug 'tpope/vim-fugitive'
"       Extension of fugitive, compatible.           TODO compatible w/ what?
        Plug 'gregsexton/gitv'                
"       Enable display of git status in sign-column.
        Plug 'airblade/vim-gitgutter'

"   TMUX
"   -------------------------------------------------------------------------

"       Make all words on screen available in auto-complete.
        Plug 'wellle/tmux-complete.vim'
"       Treat TMUX- & vim-panes equally.         -> navigate with c-a h/j/k/l
        Plug 'christoomey/vim-tmux-navigator' 

"   THEMES & GENERAL APPEARANCE
"   -------------------------------------------------------------------------

"       Solarized
        Plug 'altercation/vim-colors-solarized'
      " Plug 'lifepillar/vim-solarized8'
      " Plug 'tomasiser/vim-code-dark'
      " Plug 'morhetz/gruvbox'

"       Devicons
        Plug 'ryanoasis/vim-devicons'

"   MINIMALISM
"   -------------------------------------------------------------------------

"       Goyo -> Clean up editor.
        Plug 'junegunn/goyo.vim'

"       LimeLight -> Highlight only relevant sections.
        Plug 'junegunn/limelight.vim'

"   STATUS BAR
"   -------------------------------------------------------------------------

"       Airline
        Plug 'vim-airline/vim-airline'
        Plug 'vim-airline/vim-airline-themes'
      " Plug 'edkolev/tmuxline.vim'

"   G.T.D.                                       (-> moved to Emacs Org-Mode)
"   -------------------------------------------------------------------------

        Plug 'mattn/calendar-vim', { 'for': 'vimwiki' }
      " Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
      " Plug 'BlindFS/vim-taskwarrior'
      " Plug 'tools-life/taskwiki', { 'for': 'vimwiki' }
      " Plug 'itchyny/calendar.vim'
      " Plug 'evansalter/vim-checklist'
      " Plug 'jceb/vim-orgmode'

"   CODE FOLDING
"   -------------------------------------------------------------------------

"       Indentation based folding:
      " Plug 'tmhedberg/SimpylFold', {'for': 'python'}  

"       Faster folds:
      " Plug 'Konfekt/FastFold', {'for': 'python'}      

"   VARIOUS
"   -------------------------------------------------------------------------

"       Floating terminal:
        Plug 'voldikss/vim-floaterm'

"       Undo-Tree: Visualize undo-history in navigable tree.
        Plug 'mbbill/undotree'

"       Various nice plugins by tpope speeding up vim-workflow
        Plug 'tpope/vim-commentary'
        Plug 'tpope/vim-repeat'
        Plug 'tpope/vim-surround'
        Plug 'tpope/vim-speeddating'
        Plug 'tpope/vim-unimpaired'

        Plug 'lewis6991/impatient.nvim'

"       No line numbers where they don't belong:
      " Plug 'myusuf3/numbers.vim'

"       Preview range, pattern and substitute:
      " Plug 'markonm/traces.vim'

"       Unsorted/Ideas:
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
      " matchit.vim 
      " a.vim
  
  call plug#end()
  
" }}} ═════════════════════════════════════════════════════════════════════════
"                                                                    APPEARANCE
" ═════════════════════════════════════════════════════════════════════════════
"                                  APPEARANCE:                              {{{
" ═════════════════════════════════════════════════════════════════════════════

"   Show typed commands in lower-right corner of editor window.
"   TODO: Change `ctermfg` for `showcmd` display-text. -> Green?
    set showcmd

"   TODO: What does this do? Do I need it?
  " hi PmenuSel ctermfg=black ctermbg=red
  " hi PmenuSbar ctermfg=black ctermbg=red
    hi Pmenu ctermfg=black ctermbg=gray
    " -> needed for e.g. FloatTerm borders

" }}} ═════════════════════════════════════════════════════════════════════════
"                            APPEARANCE: Color-Scheme                       {{{
" ═════════════════════════════════════════════════════════════════════════════

"   Specify name of colorscheme.
    colorscheme solarized

"   Enable dark-mode by default.
  " set background=dark

"   Define keyboard short-cuts to toggle btw. light- & dark-mode.
    map <leader>ml :set bg=light<CR>  
    map <leader>md :set bg=dark<CR>

"   Tell vim to use degraded colors.
"   - Needs to be active for solarized-black iTerm profile.  TODO [#B] Really?
"   - See: https://github.com/altercation/vim-colors-solarized#important-note-for-terminal-users
  " let g:solarized_termcolors=256                      

" }}} ═════════════════════════════════════════════════════════════════════════
"                             APPEARANCE: Background                        {{{
" ═════════════════════════════════════════════════════════════════════════════

"       Make background transparent.
        highlight Normal ctermbg=None  

" }}} ═════════════════════════════════════════════════════════════════════════
"                             APPEARANCE: Cursor                            {{{
" ═════════════════════════════════════════════════════════════════════════════
    
"   Always have at least 10 lines above/below cursor on screen.
    set scrolloff=10

"   Show on which line the cursor is by highlighting the whole row.
  " set cursorline

" }}} ═════════════════════════════════════════════════════════════════════════
"                              APPEARANCE: Fonts                            {{{
" ═════════════════════════════════════════════════════════════════════════════

"   Use Hack Nerd in GUI-vim as well.
    set guifont="Hack Nerd Font"

" }}} ═════════════════════════════════════════════════════════════════════════
"                          APPEARANCE: Intra-Text Search                    {{{
" ═════════════════════════════════════════════════════════════════════════════

"   Turn off search match highlighting.
    nnoremap <leader>/ :nohlsearch<CR>

" }}} ═════════════════════════════════════════════════════════════════════════
"                           APPEARANCE: Line Numbers                        {{{
" ═════════════════════════════════════════════════════════════════════════════
"   Setup method of displaying line-numbers on the left side of the editor.

"   Use relative numbers in normal mode.
    set number relativenumber
  " set numberwidth=5
  " set nonumber

"   Toggle relative line numbers
    nnoremap <leader>ln :set number! relativenumber!<cr>
  " nnoremap <leader>rln :set relativenumber!<cr>
  " nnoremap <leader>ln :set number!<cr>

  " nnoremap d :set number relativenumber<cr>


"   Switch to absolute line numbering when in insert mode.          -> inactive
  " augroup numbertoggle
  "     autocmd!
  "     autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  "     autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
  " augroup END

"   Make background transparent.                
    highlight LineNr ctermbg=None 
    
" }}} ═════════════════════════════════════════════════════════════════════════
"                    APPEARANCE: Sign- & Color-Column                       {{{
" ═════════════════════════════════════════════════════════════════════════════
" - sign column   ->   left edge of screen
" - color column  ->  right edge of screen

"   SIGN COLUMN:                                              
"   ───────────────────────────────────────────────────────────────────────────

"       Always display sign-column where error symbols would be displayed.
        set signcolumn=yes
        highlight clear SignColumn
        " highlight SignColumn ctermfg=red ctermbg=none

"       Deactivate tildes on the left side of the screen
        let &fillchars='eob: '
      " set fillchars=eob: 
      " highlight EndOfBuffer ctermfg=0 ctermbg=none

"   COLOR COLUMN:                                                 
"   ───────────────────────────────────────────────────────────────────────────
"   - deactivated at the moment

"       Method b: Color text after column 80 in e.g. red.
      " autocmd BufEnter * match Error /\%>80c/

"       Method a: Display color-column to signify the 81st column.
      " set textwidth=80
      " set colorcolumn=81
      " highlight ColorColumn ctermbg=235

"       Method c: Display color-column only if text width is >80.
"       TODO: Implement

" }}} ═════════════════════════════════════════════════════════════════════════
"                           APPEARANCE: Status Line                         {{{
" ═════════════════════════════════════════════════════════════════════════════

"   Don't show vim-mode.
    set noshowmode 

"   Don't show current location in file.
    set noruler    

"   Set colors of statusline. (invisible)
    hi StatusLine ctermbg=None ctermfg=black

" }}} ═════════════════════════════════════════════════════════════════════════
"                        APPEARANCE: Syntax Highlighting                    {{{
" ═════════════════════════════════════════════════════════════════════════════

"   Turn on syntax highlighting. 
      syntax on
"   NOTE: ^ needs to be up here in file, not to conflict with SignCol!

"   Highlight matching brackets for (), [], {}, and <>   
"   - NOTE: Switch between them with %
    set showmatch
    set matchpairs+=<:>

"   Use colorizer pugin to display RGBA hex-codes in corresponding color.
  " autocmd BufEnter * :ColorHighlight <CR>
  " lua require'colorizer'.setup()

"   Flag erroneous whitespace.
  " au BufRead, BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

"   Show indentation markers.
"   TODO: Implement.

" }}} ═════════════════════════════════════════════════════════════════════════
"                            APPEARANCE: Welcome Screen                     {{{
" ═════════════════════════════════════════════════════════════════════════════
"   TODO: Check if correct, how does this work exactly?

"   Deactivate welcome text by setting its color to background.
"   NOTE: Welcome text is deactivated anyways. -> Not needed anymore.
"   TODO: Now the message is there again. EVEN if I re-activate below...???
"   NOTE: Now it's gone again...
    autocmd BufEnter * :highlight NonText guifg=bg<CR>

"   TODO: Add description.
    set shortmess=""

"   Prevent vim from printing welcome message.            
    set shortmess+=I

"   Prevent Vim from echoing the current filename into the commandline.
    set shortmess+=F


" }}} ═════════════════════════════════════════════════════════════════════════
"                                 APPEARANCE: ...                           {{{

" }}} ═════════════════════════════════════════════════════════════════════════
"                                                                    NAVIGATION
" ═════════════════════════════════════════════════════════════════════════════
"                                NAVIGATION:                                {{{
" ═════════════════════════════════════════════════════════════════════════════

"   Activate mouse.
    set mouse=a  

"   Move vertically by visual line.
    nnoremap j gj
    nnoremap k gk

" }}} ═════════════════════════════════════════════════════════════════════════
"                    NAVIGATION: Quick-Open Config Files                    {{{
" ═════════════════════════════════════════════════════════════════════════════

"   NeoVim
    map <Leader>cvim :tabnew $XDG_CONFIG_HOME/nvim/init.vim <CR>
    command! -nargs=? Ftedit execute "tabe $XDG_CONFIG_HOME/nvim/ftplugin/" . ("<args>" == "" ? &filetype : "<args>") . ".vim"
    map <Leader>cvft :Ftedit <CR>
    map <Leader>ccoc :CocConfig <CR>
    map <leader>csnp :CocCommand snippets.openSnippetFiles <CR>

"   Pylint
  " map <Leader>cpl :tabnew ~/.pylintrc <CR>

"   QuteBrowser
    map <leader>cqtb :tabnew $XDG_CONFIG_HOME/qutebrowser/config.py <CR>

"   Shell/Zsh
    map <Leader>czsh :tabnew $ZSHRC <CR>
    map <Leader>cali :tabnew $XDG_CONFIG_HOME/shell/aliasrc <CR>

"   Suckless DWM
    map <Leader>cdwm :tabnew $XDG_CONFIG_HOME/dwm/config.h <CR>

"   Suckless Terminal
    map <Leader>cst :tabnew $XDG_CONFIG_HOME/st/config.h <CR>

"   TMUX
    map <Leader>ctmx :tabnew $HOME/.tmux.conf <CR>

"   Xorg (on Linux)
    map <Leader>cxrc :tabnew $XINITRC <CR>
    map <Leader>cxrc :tabnew $XDG_CONFIG_HOME/x/xinitrc <CR>

" }}} ═════════════════════════════════════════════════════════════════════════
"                         NAVIGATION: Search inside Files                   {{{
" ═════════════════════════════════════════════════════════════════════════════
"   Configure intra-file search.                                  (-> with "/")

"   Search incrementally as characters are entered, & highlight matches.
    set incsearch hlsearch
  " set nohlsearch

"   Make case-insensitive, except if capital letters are entered explicitly.
    set ignorecase smartcase

" }}} ═════════════════════════════════════════════════════════════════════════
"                        NAVIGATION: Switch between files                   {{{
" ═════════════════════════════════════════════════════════════════════════════

"   Go back to last opened file with backspace.
    nmap <BS> <C-^>

"   Switch between buffers.                    (Re-map: Use buffers, not tabs!)
    map gn :bn<cr>
    map gp :bp<cr>
  " map gd :bd<cr> 

" }}} ═════════════════════════════════════════════════════════════════════════
"                                 NAVIGATION: ...                           {{{

" }}} ═════════════════════════════════════════════════════════════════════════
"                                                                       EDITING
" ═════════════════════════════════════════════════════════════════════════════
"                           EDITING: Auto-Completion                        {{{
" ═════════════════════════════════════════════════════════════════════════════

"   Automatically close brackets.
"   NOTE: Unused, this is done by CoC now.
  " inoremap ( ()<left>
  " inoremap [ []<left>
  " inoremap { {}<left>
  " inoremap " ""<left>
  " inoremap ' ''<left>

" }}} ═════════════════════════════════════════════════════════════════════════
"                        EDITING: Code Collapsing & Folds                   {{{
" ═════════════════════════════════════════════════════════════════════════════

"   Enable folding.
    set foldmethod=manual

"   Fold all on file-open.
    set foldlevel=99

"   Make vim-folds less awful-looking.
    highlight clear Folded

"   Remove dots.
    set fillchars+=fold:\ 

" }}} ═════════════════════════════════════════════════════════════════════════
"                             EDITING: Code Skeletons                       {{{
" ═════════════════════════════════════════════════════════════════════════════

"   Define code skeletons.
  " autocmd BufNewFile *.sh     0r      ~/.config/nvim/skeletons/script.sh

" }}} ═════════════════════════════════════════════════════════════════════════
"                               EDITING: Comments                           {{{
" ═════════════════════════════════════════════════════════════════════════════

"   Enable autocomment on newline.
    set formatoptions+=r

"   Disable auto comment on new line.
  " autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
        
" }}} ═════════════════════════════════════════════════════════════════════════
"                            EDITING: Copy & Paste                          {{{
" ═════════════════════════════════════════════════════════════════════════════

"   Copy & paste to system clipboard.
    if has('clipboard')
        set clipboard=unnamed
        if has('unnamedplus')  " X11 support
            set clipboard+=unnamedplus
        endif
    endif

"   TODO: Add description.
    vnoremap <C-c> :w !pbcopy<CR><CR>
    noremap <C-v> :r !pbpaste<CR><CR>

" }}} ═════════════════════════════════════════════════════════════════════════
"                               EDITING: Indentation                        {{{
" ═════════════════════════════════════════════════════════════════════════════

"   Define default indentation settings.
    set softtabstop=4
    set shiftwidth=4
    set expandtab
    set autoindent

" }}} ═════════════════════════════════════════════════════════════════════════
"                      EDITING: Insert Date/Time String                     {{{
" ═════════════════════════════════════════════════════════════════════════════

"   Paste date-string.
  " map <Leader>sfd :pu=strftime('%Y-%m-%d')<CR>

"   Paste time-string.
  " map <Leader>sft :pu=strftime('%H:%M:%S')<CR>

" }}} ═════════════════════════════════════════════════════════════════════════
"                               EDITING: Linting                            {{{
" ═════════════════════════════════════════════════════════════════════════════

"   Remove trailing whitespaces.
    command! FixWhitespace :%s/\s\+$//e

" }}} ═════════════════════════════════════════════════════════════════════════
"                               EDITING: Macros                             {{{
" ═════════════════════════════════════════════════════════════════════════════

"   Define shortcut to re-run last-executed macro.
    nnoremap Q @@

"   Only redraw screen after macro is finished.                     -> speed-up
    set lazyredraw

" }}} ═════════════════════════════════════════════════════════════════════════
"                        EDITING: Newline from Normal Mode                  {{{
" ═════════════════════════════════════════════════════════════════════════════

"   Create newline below current line without entering insert mode.
    " nmap <CR> o<C-c>

" }}} ═════════════════════════════════════════════════════════════════════════
"                             EDITING: Quick-Move Lines                     {{{
" ═════════════════════════════════════════════════════════════════════════════

"    TODO Add description.
     nnoremap <leader>k :m-2<cr>==
     xnoremap <leader>k :m-2<cr>gv=gv
     nnoremap <leader>j :m+<cr>==
     xnoremap <leader>j :m'>+<cr>gv=gv

" }}} ═════════════════════════════════════════════════════════════════════════
"                               EDITING: Wrapping                           {{{
" ═════════════════════════════════════════════════════════════════════════════

"   Disable wrapping for long lines.
    set nowrap
    set formatoptions-=t

" }}} ═════════════════════════════════════════════════════════════════════════
"                               EDITING: Yanking                             {{{
" ═════════════════════════════════════════════════════════════════════════════

"   Define shortcut to yank until end of line.
    nnoremap Y y$

" }}} ═════════════════════════════════════════════════════════════════════════
"                                   EDITING: ...                            {{{

" }}} ═════════════════════════════════════════════════════════════════════════
"                                                                       PLUGINS
" ═════════════════════════════════════════════════════════════════════════════
"                                 PLUGIN: Ag/Ack                           {{{
" ═════════════════════════════════════════════════════════════════════════════
"   Use case: Search for text in all files in the current directory.

"   If the silver-searcher (a.k.a. `ag`) is installed, use it instead of `ack`.
"   TODO: Install `ag`.
"   TODO: Remove `--nocolor` flag.
    if executable('ag')
        let g:ackprg = 'ag --nogroup --nocolor --column'
    endif

"   Map `<Leader> + a` to intra-text search.
    nnoremap <leader>a :Ack! -Q ""<Left>

" }}} ═════════════════════════════════════════════════════════════════════════
"                               PLUGIN: Airline                             {{{
" ═════════════════════════════════════════════════════════════════════════════

"   Define airline theme.
"   ───────────────────────────────────────────────────────────────────────────

"   Define theme: `solarized`.
    let g:airline_theme = 'solarized' 

"   Use dark background.
    let g:airline_solarized_bg = 'dark'

"   Configure tab-bar.
"   ───────────────────────────────────────────────────────────────────────────

"   Activate tab-line extension.
    let g:airline_extensions = ["tabline"]                

"   Turn off triangle thingies.
    let g:airline_right_sep=''
  " let g:airline_left_sep=''

"   Use dark text in file-name (at left end of airline).
    let g:airline_solarized_dark_text = 1

"   Customize Colors of...                                  (for vanilla-vim)
"   ...selected tab:
  " hi TabLineSel ctermfg=Red ctermbg=Yellow
"   ...unselected tab:
  " hi TabLineFill ctermfg=LightGreen ctermbg=DarkGreen
"   ...background of tabline:
  " hi TabLine ctermfg=Blue ctermbg=Yellow
"   ...window counter per tab (?)
  " hi Title ctermfg=LightBlue ctermbg=Magenta

"   Make tab-bar background invisible/black.
    augroup HITABFILL
        autocmd!

"       Change `airline_tabfill` colors to black/transparent.
        autocmd User AirlineAfterInit hi airline_tabfill ctermbg=black ctermfg=none

"       The following options don't seem to affect status-bar colors... (?)
      " autocmd User AirlineAfterInit hi airline_tabfill_to_airline_tabfill ctermbg=black ctermfg=none
      " autocmd User AirlineAfterInit hi airline_tabhid_to_airline ctermbg=black ctermfg=none
      " autocmd User AirlineAfterInit hi airline_tabfill_to_airline_tablabel_right ctermbg=None ctermfg=red
      " autocmd User AirlineAfterInit hi airline_tabfill_to_airline_tabfill ctermbg=None ctermfg=red
      " autocmd User AirlineAfterInit hi airline_tab_right ctermbg=None ctermfg=red
      " autocmd User AirlineAfterInit hi airline_tabtype ctermbg=None ctermfg=red

    augroup END

"   Disable airline statusline.
"   ---------------------------------------------------------------------------

"   Disable statusline. (makes the following lines obsolete)
    let w:airline_disable_statusline = 1

"   Move status-line to bottom of editor window.
  " let g:airline_statusline_ontop = 0

"   Disable display of mode.
  " let g:airline_section_a = ''

"   Disable display of version control info.
  " let g:airline_section_b = ''

"   Disable display of file-name.
  " let g:airline_section_c = ''

"   Disable display of file-type.
  " let g:airline_section_x = ''

"   Disable display of file-encoding.
  " let g:airline_section_y = ''

"   Disable display of location in file.
  " let g:airline_section_z = ''
  " let g:airline_section_z = '%3p%% %3l/%L:%3v'

"   Skip empty sections. (-> less separator-triangle thingies)
  " let g:airline_skip_empty_sections = 1

"   Configure default expected file-encoding 
  " let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
  "  ^ -> file-encoding not displayed for utf-8 

"   Various    
"   ---------------------------------------------------------------------------

"   Use powerline fonts.
    let g:airline_powerline_fonts = 1

"   Display CoC-info in statusbar.
    let g:airline#extensions#coc#enabled = 1

"   Deactivate tabline-labels for buffers & tabs.
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

" }}} ═════════════════════════════════════════════════════════════════════════
"                            PLUGIN: Ale (inactive)                         {{{
" ═════════════════════════════════════════════════════════════════════════════

"   Put these lines at the very end of your vimrc file.
"   Load all plugins now.
"   Plugins need to be added to runtimepath before helptags can be generated.
  " packloadall

"   Load all of the helptags now, after plugins have been loaded.
"   All messages and errors will be ignored.
  " silent! helptags ALL

" }}} ═════════════════════════════════════════════════════════════════════════
"                        PLUGIN: Conqueror of Completion                   {{{
" ═════════════════════════════════════════════════════════════════════════════
    
"   Define list of CoC extensions.
"   ───────────────────────────────────────────────────────────────────────────

        let g:coc_global_extensions = [
            \ 'coc-docker',
            \ 'coc-eslint',
            \ 'coc-flutter',
            \ 'coc-html',
            \ 'coc-jedi',
            \ 'coc-julia',
            \ 'coc-json',
            \ 'coc-pairs',
            \ 'coc-prettier',
            \ 'coc-pyright',
            \ 'coc-rls',
            \ 'coc-rust-analyzer',
            \ 'coc-snippets',
            \ 'coc-vimtex',
        \ ]
          " \ 'coc-css',
          "     ^ -> not working anymore, for some reason...
          " \ 'coc-python',  
          "     ^ -> deprecated, use coc-jedi & coc-pyright instead.
          " \ 'coc-tsserver',
          "     ^ -> not working anymore, for some reason...
          " \ 'coc-fzf-preview',
          "     ^ -> not working anymore, for some reason...

"   Configure code completion/suggestion list.
"   ───────────────────────────────────────────────────────────────────────────

"       Select first list item by default, confirm with `TAB`.
        inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
      " inoremap <silent><expr> <TAB> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
      " inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"       Use `<Tab>` and `<S-Tab>` to go to next/previous completion list item.
        inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
        inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

"       Close the preview window when completion is done. 
"       TODO: Find out re: Is this even necessary?
      " autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

"       Decrease update-time for `CursorHold` & `CursorHoldI`.
"       TODO: What does this do?
      " set updatetime=300


"   Configure Snippets.
"   ───────────────────────────────────────────────────────────────────────────

"       Use `<Tab>` and `<S-Tab>` to go to next/previous snippet insert point:
        let g:coc_snippet_next = '<Tab>'
        let g:coc_snippet_prev = '<S-Tab>'
  
"   Configure diagnostics information.
"   ───────────────────────────────────────────────────────────────────────────

"       Use `[g` and `]g` keys to go to next/previous diagnostic info entry.
        nmap <silent> [g <Plug>(coc-diagnostic-prev)
        nmap <silent> ]g <Plug>(coc-diagnostic-next)

"   Configure documentation.
"   ───────────────────────────────────────────────────────────────────────────

"       Use `K` to show doc. for object under cursor in preview window.
        function! s:show_documentation()
            if (index(['vim', 'help'], &filetype) >= 0)
                execute 'h '.expand('<cword>')
            else
                call CocActionAsync('doHover')
            endif
        endfunction
        nnoremap <silent> K :call <SID>show_documentation()<CR>

"   Configure CoC colors.
"   ───────────────────────────────────────────────────────────────────────────

"       Configure CoC error-window colors.
        highlight CocFloating ctermbg=black ctermfg=white
        highlight CocMenuSel ctermbg=gray ctermfg=black 

"       Configure CoC inline-hint colors.
"       NOTE: Strangely enough, only `CocInlayHint` has an effect,
"             but does so on chaining-hints & rust-type hints as well.
"             Still, I'm keeping the other two in here as well...
        highlight CocInlayHint ctermfg=10
        highlight CocRustChainingHint ctermfg=10
        highlight CocRustTypeHint ctermfg=10

      " highlight CocErrorFloat ctermbg=black ctermfg=red       " -> not needed
      " highlight Pmenu ctermbg=red ctermfg=green           " -> TODO What for?
      " highlight FgCocErrorFloatBgCocFloating ctermfg=1 ctermbg=0
      " hi CocListBgRed guibg=black guifg=red
      " hi NvimInternalError guibg=black guifg=red

"   Various
"   ───────────────────────────────────────────────────────────────────────────

"       Rename word under cursor with `F2`.
"       TODO: Lookup: What does this do again?
      " nmap <F2> <Plug>(coc-rename)

      " python (?)
      " set statusline^=%{coc#status()}

"       Deactivate COC in .rs & .toml files. 
"       RLS not available in non-nightly a.t.m. -> switched to nightly.
      " autocmd BufNew,BufEnter *.rs,*.toml execute "silent! CocDisable"
      " autocmd BufLeave *.rs,*.toml execute "silent! CocEnable"

" }}} ═════════════════════════════════════════════════════════════════════════
"                       PLUGIN: EasyMotion (inactive)                       {{{
" ═════════════════════════════════════════════════════════════════════════════

"   Move to line
  " map <Leader>L <Plug>(easymotion-bd-jk)
  " nmap <Leader>L <Plug>(easymotion-overwin-line)

"   Move to word
  " map  <Leader>w <Plug>(easymotion-bd-w)
  " nmap <Leader>w <Plug>(easymotion-overwin-w)

  " <Leader>f{char} to move to {char}
  " map  <Leader>f <Plug>(easymotion-bd-f)
  " nmap <Leader>f <Plug>(easymotion-overwin-f)
  " s{char}{char} to move to {char}{char}
  " nmap <Leader>s <Plug>(easymotion-overwin-f2)

" }}} ═════════════════════════════════════════════════════════════════════════
"                           PLUGIN: Floating Terminal                       {{{
" ═════════════════════════════════════════════════════════════════════════════

"   Open terminal in vim.
  " nnoremap <silent> <leader>sh :terminal<CR>

"   Open floating terminal in vim.
    map <leader>ot :FloatermNew --height=0.8 --width=0.8 --wintype=floating --name=zsh --position=center<CR>

"   Open floating terminal and run ranger.
  " map <leader>or :Ranger<CR>
  " map <leader>r :FloatermNew --height=0.8 --width=0.8 --wintype=floating --name=zsh --position=center --autoclose=2 ranger <CR>

"   Open floating terminal and run python script.
  " map <leader>r :FloatermNew --height=0.8 --width=0.8 --wintype=floating --name=zsh --position=center --autoclose=2 python3 % <CR>


" }}} ═════════════════════════════════════════════════════════════════════════
"                                PLUGIN: Fugitive                           {{{
" ═════════════════════════════════════════════════════════════════════════════

"   Define keyboard shortcuts for `git add`, `git commit`, & `git push`.
    map <Leader>va :Git add %<CR>
    map <Leader>vc :Git commit<CR>
    map <Leader>vp :Git push<CR>

" }}} ═════════════════════════════════════════════════════════════════════════
"                                PLUGIN: FZF (inactive)                     {{{
" ═════════════════════════════════════════════════════════════════════════════
      
"   Auto-run FZF on vim-startup.
"   NOTE: This functionality was moved to shell alias definition.
  " autocmd vimenter * FZ

"   Use <leader>f to open fuzzy finder.
"   - NOTE: Type ' next for exact search.
    " nnoremap <silent> <leader>ff :FZF<CR>
  " nnoremap <silent> <leader>f :FzfPreviewDirectoryFiles <CR>
  " nnoremap <silent> <leader>fg :FzfPreviewProjectFiles<CR>
  " nnoremap <silent> <leader>fb :FzfPreviewBuffers<CR>
  " nnoremap <silent> <leader>fc :Commits<CR>
  " nnoremap <silent> <leader>fbc :BCommits<CR>
  " nnoremap <silent> <leader>fs :Snippets<CR>

  " Search files by content.
  " nnoremap <silent> <leader>ff :Rg<CR>  

"   FuzzyFind flags:
"   --column: Show column number
"   --line-number: Show line number
"   --no-heading: Do not show file headings in results
"   --fixed-strings: Search term as a literal string
"   --ignore-case: Case insensitive search
"   --no-ignore: Do not respect .gitignore, etc...
"   --hidden: Search hidden files and folders
"   --follow: Follow symlinks
"   --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
"   --color: Search color options

    " let g:fzf_action = {
    "   \ 'ctrl-t': 'tab split',
    "   \ 'ctrl-x': 'split',
    "   \ 'ctrl-v': 'vsplit' 
    "   \ }
    
    " let g:fzf_colors =
    " \ { 'fg':      ['fg', 'Normal'],
    "   \ 'bg':      ['bg', 'Normal'],
    "   \ 'hl':      ['fg', 'Comment'],
    "   \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
    "   \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
    "   \ 'hl+':     ['fg', 'Statement'],
    "   \ 'info':    ['fg', 'PreProc'],
    "   \ 'border':  ['fg', 'Ignore'],
    "   \ 'prompt':  ['fg', 'Conditional'],
    "   \ 'pointer': ['fg', 'Exception'],
    "   \ 'marker':  ['fg', 'Keyword'],
    "   \ 'spinner': ['fg', 'Label'],
    "   \ 'header':  ['fg', 'Comment'] 
    "   \ }

    " Use vim-devicons
    " let g:fzf_preview_use_dev_icons = 1

      
  " set rtp+=/usr/local/opt/fzf
  " set rtp+=~/.fzf
  " command! -bang -nargs=* Find call fzf#vim#grep('rg --column --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)" split/vsplit settings
      
"   Floating fzf
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

" }}} ═════════════════════════════════════════════════════════════════════════
"                          PLUGIN: Goyo & LimeLight                        {{{
" ═════════════════════════════════════════════════════════════════════════════

"   Goyo
"   ───────────────────────────────────────────────────────────────────────────

    nmap <Leader>g :Goyo<CR>
    xmap <Leader>g :Goyo<CR>

"   LimeLight
"   ───────────────────────────────────────────────────────────────────────────

"   Define keyboard shortcut for toggling LimeLight.
    nmap <Leader>l :Limelight!!<CR>
    xmap <Leader>l :Limelight!!<CR>

"   Define commands to be called on GoyoEnter.
    function MinimalistSetupEnable()
      " Limelight!
        " set nonumber norelativenumber
        set number relativenumber
    endfunction
    autocmd! User GoyoEnter call MinimalistSetupEnable()

"   Define commands to be called on GoyoLeave.
    function MinimalistSetupDisable()
      " Limelight!
        " set number relativenumber
      " source $XDG_CONFIG_HOME/nvim/init.vim
        quit
    endfunction
    autocmd! User GoyoLeave call MinimalistSetupDisable()

"   This color is used by solarized for comments.
"   TODO: What is this needed for?
    let g:limelight_conceal_ctermfg = "239"  

  " let g:limelight_bop = '^\s'
  " let g:limelight_eop = '\ze\n^\s'
  " let g:limelight_paragraph_span = 2

" }}} ═════════════════════════════════════════════════════════════════════════
"                               PLUGIN: NERDTree                            {{{
" ═════════════════════════════════════════════════════════════════════════════

"   Toggle NerdTree.
    map <leader>ont :NERDTreeTabsToggle<CR>

"   Let files/directories be created/removed/modified.
    set modifiable

"   Change window size.
  " let NERDTreeWinSize=33

"   Only show relevant files, hide the rest.
    let NERDTreeIgnore=['\.pyc$', '\~$', 'node_modules', '__pycache__', '.DS_Store', '\.aux', '\.fdb_latexmk', '\.fls', '\.log', '\.nav', '\.out', '\.snm', '\.gz', '\.toc', '\.lof', '\.dvi', 'target', 'Cargo.lock']

"   But DO show hidden files (starting with colon).
    let NERDTreeShowHidden=1

"   Show bookmarks.
    let NERDTreeShowBookmarks=1

"   Don't show "Press ? for help" text.
    let NERDTreeMinimalUI = 1

"   Remap jump to siblings to avoid conflict with tmux pane change
    let g:NERDTreeMapJumpPreviousSibling = '<M-k>'
    let g:NERDTreeMapJumpNextSibling = '<M-j>'

"   Open tree automatically, but only if not invoked by Git.
  " autocmd VimEnter * if &filetype !=# 'gitcommit' | NERDTree | wincmd p | endif

"   Close tree automatically, if only window open is tree.
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif 
       
"   Customize git symbols.
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

"   Open nerdtree in all tabs.
  " autocmd VimEnter * NERDTree                 
  " autocmd BufEnter * NERDTreeMirrorOpen
  " autocmd VimEnter * wincmd w

"   Show little arrows for expandable directories (active by default anyways)
  " let NERDTreeDirArrows = 1

"   TODO: Sort.
  " let NERDTreeAutoDeleteBuffer = 1
  " let g:NERDTreeShowIgnoredStatus = 1
    
" }}} ═════════════════════════════════════════════════════════════════════════
"                                 PLUGIN: Ranger                           {{{
" ═════════════════════════════════════════════════════════════════════════════

"   Deactivate default mapping (<leader>f)
    let g:ranger_map_keys = 0 

"   Override default ranger command.
    let g:ranger_command_override = 'ranger --confdir=$XDG_CONFIG_HOME/ranger'

" }}} ═════════════════════════════════════════════════════════════════════════
"                           PLUGIN: UltiSnips (inactive)                   {{{
" ═════════════════════════════════════════════════════════════════════════════
" - NOTE: Deactivated -> Moved to loading snippets via COC.

"   Define path to directory where snippets should be saved to.
  " let g:UltiSnipsSnippetsDir='$XDG_CONFIG_HOME/nvim/UltiSnips/'

"   Define path to directory where snippets should be loaded from.
  " let g:UltiSnipsSnippetDirectory='$XDG_CONFIG_HOME/nvim/UltiSnips/'
  " let g:UltiSnipsSnippetDirectories = ['UltiSnips']
    
"   Open new tab when editing snippets via `:UltiSnipsEdit` in vim.
  " let g:UltiSnipsEditSplit='tabdo'
    
" Trigger configuration: Do not use <tab> if you use YCM.
  " let g:UltiSnipsExpandTrigger="<CR>"
  " let g:UltiSnipsExpandTrigger="<c-space>"

" Move through suggestions list via `ctrl-b` and `ctrl-z.`
  " let g:UltiSnipsJumpForwardTrigger="<c-b>"
  " let g:UltiSnipsJumpBackwardTrigger="<c-z>"
    
" Use Python 3 for UltiSnips.
  " let g:UltiSnipsUsePythonVersion=3

" }}} ═════════════════════════════════════════════════════════════════════════
"                                PLUGIN: UndoTree                           {{{
" ═════════════════════════════════════════════════════════════════════════════

"   Toggle UndoTree.
    map <leader>out :UndotreeToggle <CR>

" }}} ═════════════════════════════════════════════════════════════════════════
"                              PLUGIN: QuickTeX                            {{{
" ═════════════════════════════════════════════════════════════════════════════

"   Define QuickTEX templates for LaTeX normal-mode.
    let g:quicktex_tex = {
        \ ' '    : "\<ESC>:call search('<+.*+>')\<CR>\"_c/+>/e\<CR>",
    \}
    
"   Define QuickTEX templates for LaTeX math-mode.
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

" }}} ═════════════════════════════════════════════════════════════════════════
"                         PLUGIN: SimpylFold (inactive)                     {{{
" ═════════════════════════════════════════════════════════════════════════════

"   Preview docstrings in folded mode.
  " let g:SimpylFold_docstring_preview = 1        
  " let g:SimpylFold_fold_docstring=0
  "
"   Don't fold import statements.
  " let g:SimpylFold_fold_import=0              
    
"   Nicer folding.
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

" }}} ═════════════════════════════════════════════════════════════════════════
"                            PLUGIN: TaskWarrior (inactive)                 {{{
" ═════════════════════════════════════════════════════════════════════════════
"   NOTE: Very messy...

"   Taskwarrior
  " highlight taskwarrior_priority ctermbg=white ctermfg=green 
  " let g:task_highlight_field=0
  " let g:task_readonly=0

"   Define filetypes for checklist autocompletion on "- [ ] <CR>".
  " let g:checklist_filetypes = ['markdown', 'text', 'org', 'wiki', 'vimwiki'] 
      
"   Custom conceal
  " syntax match todoCheckbox "\[\ \]" conceal cchar=
  " syntax match todoCheckbox "\[X\]" conceal cchar=
  " syntax match todoCheckbox "- \[\ \]" conceal cchar=
  " syntax match todoCheckbox "- \[X\]" conceal cchar=
  " syntax match todoCheckbox "* \[\ \]" conceal cchar=
  " syntax match todoCheckbox "* \[X\]" conceal cchar=
  " let b:current_syntax = "todo"

"   todoCheckbox
  " if exists("b:current_syntax")
  "   finish
  " endif
    
  " hi def link todoCheckbox Todo
  " hi Conceal guibg=NONE

  " nnoremap <leader>t :tabnew <bar> :TW<CR>
  " map <leader>x :ChecklistToggleCheckbox<CR>
  " map <leader>y :CalendarH<CR>

"   Only highlight text after col-80 in red if file is *.wiki
  " au BufEnter *.wiki let b:is_wiki_file=1
  " au BufEnter *.vimwiki let b:is_wiki_file=1
  " if !exists("b:is_wiki_file")
  "     " echo exists("b:is_wiki_file")
  "     " echo b:is_wiki_file
  "     autocmd BufEnter * match Error /\%>80c/
  " endif

" }}} ═════════════════════════════════════════════════════════════════════════
"                                PLUGIN: Telescope                          {{{
" ═════════════════════════════════════════════════════════════════════════════
"   TODO: Find out whether FZF extension is actually loaded & used.

"   File search
"   ───────────────────────────────────────────────────────────────────────────
"   NOTE: All commands below respect `.gitignore`, if not specified otherwise.

"       List files in your current working directory.
        nnoremap <leader>ff <cmd>Telescope find_files<cr>

"       Search for a string in $(pwd) and get results live as you type.
        nnoremap <leader>fg <cmd>Telescope live_grep<cr>

"       List previously open files.
        nnoremap <leader>fr <cmd>Telescope oldfiles<cr>

"       Fuzzy search through the output of git ls-files command.
      " nnoremap <leader>fg <cmd>Telescope git_files<cr>

"       Search for the string under your cursor in $(pwd).
      " nnoremap <leader>fg <cmd>Telescope grep_string<cr>

"   Other
"   ───────────────────────────────────────────────────────────────────────────
"   see more here:     https://github.com/nvim-telescope/telescope.nvim#pickers

"       List open buffers in current neovim instance.
        nnoremap <leader>fb <cmd>Telescope buffers<cr>

"       List git commits with diff preview, checkout action <cr>, 
"       reset mixed <C-r>m, reset soft <C-r>s and reset hard <C-r>h.
        nnoremap <leader>fc <cmd>Telescope git_commits<cr>

"       List manpage entries, opens them in a help window on <cr>.
        nnoremap <leader>fm <cmd>Telescope man_pages<cr>

"       List items in the quickfix list.
        nnoremap <leader>fq <cmd>Telescope quickfix<cr>

"       List Built-in pickers and run them on <cr>.
        nnoremap <leader>fa <cmd>Telescope builtin<cr>

"       List Built-in pickers and run them on <cr>.
        " nnoremap <leader>fr <cmd>Telescope repo<cr>

" }}} ═════════════════════════════════════════════════════════════════════════
"                         PLUGIN: TMUX-Line (inactive)                      {{{
" ═════════════════════════════════════════════════════════════════════════════

"   Apply same theme for TMUX statusbar as for airline.           (deactivated)
  " let g:tmuxline_preset = {
  "     \'a'    : '#S',
  "     \'b'    : '',
  "     \'c'    : '',
  "     \'win'  : '#I #W',
  "     \'cwin' : '#I #W',
  "     \'x'    : '',
  "     \'y'    : '%a %d, %R',
  "     \'z'    : ''}

" }}} ═════════════════════════════════════════════════════════════════════════
"                        PLUGIN: Vim-Table-Mode (inactive)                  {{{
" ═════════════════════════════════════════════════════════════════════════════
" NOTE: activate with `<Leader>tm`

"   Define alignment.
    let g:table_mode_align_char = ':'

"   Make ReST-compatible.
  " let g:table_mode_header_fillchar='='
  " let g:table_mode_corner_corner='+'

" }}} ═════════════════════════════════════════════════════════════════════════
"                                    PLUGIN: ...                            {{{

" }}} ═════════════════════════════════════════════════════════════════════════
"                                                                       VARIOUS
" ═════════════════════════════════════════════════════════════════════════════
"                           Unused / Unsorted / Old                         {{{
" ═════════════════════════════════════════════════════════════════════════════

"   TODO: What does this do? Do I need it?
  " augroup colorscheme_coc_setup | au!
  "     au ColorScheme * call s:my_colors_setup()
  " augroup END
    
"   TODO: What does this do? Do I need it?
  " setlocal cole=1
    
"   Turn off indent lines by default.
  " autocmd BufEnter * IndentLinesDisable

"   TODO: What do these do? 
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
    
"   Reload current file from disk.
  " map <M-r> :e % <CR>

"   Check spelling. (Orthography?)
  " map <leader>o: :setlocal spell! spelllang=en_US<CR>

"   Sort (?)
  " map <Leader>ss :sort<CR>

"   Make command-mode file auto-completion prettier.
  " set wildmode=longest,list,full  " TODO: Really necessary? I also have COC...
  
"   Allow backspace in insert mode
  " set backspace=indent,eol,start  

  " set concealcursor=nc

"   Prompt for a command to run
  " map <Leader>vp :VimuxPromptCommand<CR>

"   Run last command executed by VimuxRunCommand
  " map <Leader>vl :VimuxRunLastCommand<CR>

"   Inspect runner pane
  " map <Leader>vi :VimuxInspectRunner<CR>
    
  " noremap <r> :so % <Enter>                   " reload vimrc (has lead to crash)
          
"   Calendar
  " let g:calendar_frame = 'default'

  " set verbosefile=log.txt

    " hi PmenuThumb ctermfg=green ctermbg=green
    " hi PmenuSbar ctermfg=red ctermbg=red
    " hi PmenuThumb ctermfg=None ctermbg=None
    " hi PmenuSbar ctermfg=None ctermbg=None

    " hi clear PmenuThumb
    " hi clear PmenuSbar

    " hi PmenuSel ctermfg=red ctermbg=green
    " hi Normal ctermfg=white

"   Deactivate interpretation of `CTRL-j` as <CR>. (not working :/)
  " let g:BASH_Ctrl_j = 'off'
  " let g:C_Ctrl_j = 'off'
  " iunmap <C-J>
  " iunmap <C-K>
  " iunmap <buffer> <C-J>
  " iunmap <buffer> <C-K>

" }}}

    function GoyoTelescope()
        Goyo
        Telescope find_files
    endfunction

