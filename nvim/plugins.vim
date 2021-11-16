
" =============================================================================
" 								        PLUGINS
" =============================================================================

"                                         make sure plugin manager is installed
if empty(glob('$CONF/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
	\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $NVIMRC
endif

"                                                               install plugins
call plug#begin('$CONF/nvim/plugged')

    " 						   		code completion
    " -------------------------------------------------------------------------
    " auto completion engine
    Plug 'neoclide/coc.nvim', {'branch': 'release'}   
    "  snippet engine
    Plug 'SirVer/ultisnips' 
    Plug 'honza/vim-snippets'
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
    Plug 'junegunn/fzf'
    " Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install --all' }
    Plug 'yuki-ycino/fzf-preview.vim'
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
"    Plug 'yuttie/comfortable-motion.vim'
    Plug 'mbbill/undotree'
    " Plug 'godlygeek/tabular'
    " Plug 'severin-lemaignan/vim-minimap' " not working TODO
    Plug 'voldikss/vim-floaterm'
    " Plug 'townk/vim-autoclose'
"    Plug 'vim-scripts/camelcasemotion'  " usage e.g.: ,w or ,b or ,e

    "                                                                       gtd
    " -------------------------------------------------------------------------
    Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
    " Plug 'BlindFS/vim-taskwarrior'
    Plug 'tools-life/taskwiki', { 'for': 'vimwiki' }
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
