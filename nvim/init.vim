
" =============================================================================
" 				  neovim init.vim
" =============================================================================

"                                                                   leader keys
" -----------------------------------------------------------------------------
let mapleader="\<space>"
let maplocalleader ="\<tab>"

"                                   PLUGINS
" =============================================================================

filetype indent plugin on

" 					Plugins                             {{{
" =============================================================================

"                                         make sure plugin manager is installed
if empty(glob('$XDG_CONFIG_HOME/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
	\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $NVIMRC
endif

"                                                               install plugins
call plug#begin('$XDG_CONFIG_HOME/nvim/plugged')

    " 						   		code completion
    " -------------------------------------------------------------------------
    " auto completion engine
    Plug 'neoclide/coc.nvim', {'branch': 'release'}   
    "  snippet engine
    " Plug 'SirVer/ultisnips' 
    " Plug 'honza/vim-snippets'
    " Plug 'ycm-core/YouCompleteMe'
    " all words on screen are available in autocompletion
    Plug 'wellle/tmux-complete.vim'

    "                                                              file manager
    " ------------------------------------------------------------------------
    "                                                                  NERDTree
    Plug 'scrooloose/nerdtree'
    " keep NERDTree consistent across vim tabs
    Plug 'jistr/vim-nerdtree-tabs'
    " press m-x on file in NerdTree to quickly open files with default app
    Plug 'ivalkeen/nerdtree-execute'
    "                                               show git status in NerdTree
    Plug 'Xuyuanp/nerdtree-git-plugin'

    "                                                         language specific
    " -------------------------------------------------------------------------
    "                                                                      HTML
"    Plug 'Valloric/MatchTagAlways', {'for': 'html'}
    "                                                                     LATEX
    Plug 'lervag/vimtex', {'for': 'tex'}               
    " Plug 'brennier/quicktex', {'for': 'tex'}
    "                                                                  MARKDOWN
    "                                               folding markdown by section
    Plug 'masukomi/vim-markdown-folding', {'for': 'markdown'}
    "                                   preview markdown, automatic reloads (?)
    " Plug 'kannokanno/previm'
    "                                very nice tables, activate with <leader>tm
"    Plug 'dhruvasagar/vim-table-mode'
"    Plug 'coderifous/textobj-word-column.vim'
    "                                                                    PYTHON
"    Plug 'jmcantrell/vim-virtualenv', {'for': 'python'}
"    Plug 'vim-scripts/indentpython.vim', {'for': 'python'}
    " Plug 'nvie/vim-flake8'                        " PEP8 checking
"    Plug 'tmhedberg/SimpylFold', {'for': 'python'}  " indentation based folding
"    Plug 'Konfekt/FastFold', {'for': 'python'}      " speeds up folding
"    " Plug 'thalesmello/vim-textobj-multiline-str'

    Plug 'cespare/vim-toml'

    "                                                      minimalist vim setup
    " -------------------------------------------------------------------------
    "                                                       goyo: clean editing
    Plug 'junegunn/goyo.vim'
    "                               limelight: highlight only relevant sections
    Plug 'junegunn/limelight.vim'

    "  						                     navigation
    " -------------------------------------------------------------------------
    "                                   silver searcher: find files by c-string
    Plug 'mileszs/ack.vim'
    "                                                    fzf: fuzzy file search
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': { -> fzf#install() } }
        " TODO use telescope instead?
    Plug 'junegunn/fzf'
    " Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install --all' }
    " Plug 'yuki-ycino/fzf-preview.vim'   " TODO setup
    "                                                                     ranger
"    Plug 'francoiscabrol/ranger.vim'
"    Plug 'rbgrouleff/bclose.vim'
    "                                          easymotion: vim motions on speed
    " Plug 'easymotion/vim-easymotion'
    "                                                                      tags
    " Plug 'vim-scripts/taglist.vim'
    " Plug 'ludovicchabant/vim-gutentags'

    "  						                     status bar
    " -------------------------------------------------------------------------
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
"    " Plug 'edkolev/tmuxline.vim'

    "  						                        various
    " -------------------------------------------------------------------------
    Plug 'tpope/vim-surround'
"    Plug 'Konfekt/vim-CtrlXA'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-commentary'
    " matchit.vim, snipmate.vim, a.vim, 
    " Plug 'takac/vim-hardtime'
    Plug 'tpope/vim-unimpaired'
    " Plug 'greyblake/vim-esperanto'
    " atom editor
"    Plug 'yuttie/comfortable-motion.vim'
    Plug 'mbbill/undotree'
    " Plug 'godlygeek/tabular'
    " Plug 'severin-lemaignan/vim-minimap' " not working TODO
    Plug 'voldikss/vim-floaterm'
    " Plug 'townk/vim-autoclose'
"    Plug 'vim-scripts/camelcasemotion'  " usage e.g.: ,w or ,b or ,e

    "                                                                       gtd
    " -------------------------------------------------------------------------
    " Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
    " Plug 'BlindFS/vim-taskwarrior'
    " Plug 'tools-life/taskwiki', { 'for': 'vimwiki' }
    Plug 'tpope/vim-speeddating'
    " Plug 'itchyny/calendar.vim'
    Plug 'mattn/calendar-vim', { 'for': 'vimwiki' }
    " Plug 'evansalter/vim-checklist'
    " Plug 'jceb/vim-orgmode'

    "  						                version control
    " -------------------------------------------------------------------------
    "                          very nice git plugin, everything from inside vim
    Plug 'tpope/vim-fugitive'
    "                                         extension of fugitive, compatible
    Plug 'gregsexton/gitv'                
    "                                       show git information in sign column
    Plug 'airblade/vim-gitgutter'
    "  						                         visual

    " -------------------------------------------------------------------------
    "                                                              colorschemes
    Plug 'altercation/vim-colors-solarized'
    " Plug 'lifepillar/vim-solarized8'
    " Plug 'tomasiser/vim-code-dark'
    " Plug 'morhetz/gruvbox'
    "                                                           syntax checking
"    Plug 'dense-analysis/ale'
    " Plug 'maximbaz/lightline-ale'
    " Plug 'vim-syntastic/syntastic'
    "                                                       syntax highlighting
    " Plug 'sheerun/vim-polyglot'
    Plug 'machakann/vim-highlightedyank'
    "                   colorize everything that has the format #rgb or #rrggbb
    "Plug 'chrisbra/colorizer'
    " Plug 'norcalli/nvim-colorizer.lua'
    "                                                  show indentation markers
    " Plug 'yggdroot/indentline', {'for': ['python', 'javascript', 'tex', 'c', 'html']}
    "                                     preview range, pattern and substitute
    " Plug 'markonm/traces.vim'
    "                                                           devicons in vim
    Plug 'ryanoasis/vim-devicons'
    "                                   no line numbers where they don't belong
    " Plug 'myusuf3/numbers.vim'

    " 						   		           tmux
    " -------------------------------------------------------------------------
    "                                            treat tmux & vim panes equally
    Plug 'christoomey/vim-tmux-navigator' 
call plug#end()

" set concealcursor=nc

" }}}

"                                                                        config
" -----------------------------------------------------------------------------

source $XDG_CONFIG_HOME/nvim/appearance.vim
source $XDG_CONFIG_HOME/nvim/completion.vim
"                            GENERAL VIM CONFIGURATION                      {{{
" =============================================================================

set autoread  " automatically reload files from disk on change
" set backspace=indent,eol,start  " allow backspace in insert mode
set encoding=utf-8
set hidden  " buffers can exist in background, common behavior for editors

"                                restore last cursor position and marks on open
au BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
    \ |   exe "normal! g`\""
    \ | endif

"                                              copy & paste to system clipboard
" =============================================================================
if has('clipboard')
    set clipboard=unnamed
    if has('unnamedplus')  " X11 support
        set clipboard+=unnamedplus
    endif
endif
vnoremap <C-c> :w !pbcopy<CR><CR>
noremap <C-v> :r !pbpaste<CR><CR>

"                                                  default indentation settings
" =============================================================================
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent


" better macro performance
set lazyredraw  





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







" disable wrapping for long lines
set nowrap
set formatoptions-=t
" allow autocomment on newline
set formatoptions+=r

" Store lots of :cmdline history
set history=1000                            
au FocusGained,BufEnter * :checktime

" remove trailing whitespaces
command! FixWhitespace :%s/\s\+$//e

" calendar
" let g:calendar_frame = 'default'


if expand('%:e')=='tera'
    set syntax=html
endif

" }}}

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
      function MinimalistSetupEnable()
          " Limelight!
          set nonumber norelativenumber
      endfunction
      autocmd! User GoyoEnter call MinimalistSetupEnable()

      function MinimalistSetupDisable()
          " Limelight!
          set number relativenumber
          source $XDG_CONFIG_HOME/nvim/appearance.vim
          source $XDG_CONFIG_HOME/nvim/statusbar.vim
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

"                                   NAVIGATION
" =============================================================================

"                                             cursor movement inside buffer {{{
" =============================================================================
"                                                                activate mouse 
set mouse=a  
"                                                move vertically by visual line
nnoremap j gj
nnoremap k gk

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
"                                                                    ranger {{{
" =============================================================================
" deactivate default mapping (<leader>f)
let g:ranger_map_keys = 0 
" change default ranger command
let g:ranger_command_override = 'ranger --confdir=$XDG_CONFIG_HOME/ranger'

" }}}

"                                   NAVIGATION
" =============================================================================

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

"                                   NAVIGATION
" =============================================================================

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

"       fzf (file search by file name)                                      {{{
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

" source $XDG_CONFIG_HOME/nvim/ale.vim
" source $XDG_CONFIG_HOME/nvim/gtd.vim

" autocmd vimenter * FZF
