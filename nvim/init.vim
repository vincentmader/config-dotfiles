
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
source $XDG_CONFIG_HOME/nvim/general.vim
source $XDG_CONFIG_HOME/nvim/mappings.vim

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

source $XDG_CONFIG_HOME/nvim/fzf.vim
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
