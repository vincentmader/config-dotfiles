
" =============================================================================
" 								        PLUGINS
" =============================================================================

"                                         make sure plugin manager is installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
	\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
"                                                               install plugins
call plug#begin('~/.config/nvim/plugged')
    " 						   		code completion
    " -------------------------------------------------------------------------
    " auto completion engine
    Plug 'neoclide/coc.nvim', {'branch': 'release'}   
    "  snippet engine
    Plug 'SirVer/ultisnips' 
    " Plug 'honza/vim-snippets'
    " all words on screen are available in autocompletion
    Plug 'wellle/tmux-complete.vim'
    "                                                              file manager
    " ------------------------------------------------------------------------
    "                                                                  nerdtree
    " Plug 'scrooloose/nerdtree'
    " keep NERDTree consistent across vim tabs
    " Plug 'jistr/vim-nerdtree-tabs'
    " press m-x on file in NerdTree to quickly open files with default app
    " Plug 'ivalkeen/nerdtree-execute'
    "                                                         language specific
    " -------------------------------------------------------------------------
    "                                                                      HTML
    Plug 'Valloric/MatchTagAlways'
    "                                                                     LATEX
    Plug 'lervag/vimtex'               
    Plug 'brennier/quicktex'
    "                                                                  MARKDOWN
    "                                               folding markdown by section
    Plug 'masukomi/vim-markdown-folding'  
    "                                   preview markdown, automatic reloads (?)
    " Plug 'kannokanno/previm'
    "                                very nice tables, activate with <leader>tm
    Plug 'dhruvasagar/vim-table-mode'
    Plug 'coderifous/textobj-word-column.vim'
    "                                                                    PYTHON
    Plug 'jmcantrell/vim-virtualenv'
    Plug 'vim-scripts/indentpython.vim'
    " Plug 'nvie/vim-flake8'              " PEP8 checking
    Plug 'tmhedberg/SimpylFold'           " indentation based folding
    Plug 'Konfekt/FastFold'               " speeds up folding
    " Plug 'thalesmello/vim-textobj-multiline-str'
    "                                                      minimalist vim setup
    " -------------------------------------------------------------------------
    "                                                       goyo: clean editing
    Plug 'junegunn/goyo.vim'
    "                               limelight: highlight only relevant sections
    Plug 'junegunn/limelight.vim'
    "  						                     navigation
    " -------------------------------------------------------------------------
    "                                                    fzf: fuzzy file search
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install --all' }
    Plug 'yuki-ycino/fzf-preview.vim'
    "                                   silver searcher: find files by c-string
    Plug 'mileszs/ack.vim'
    "                                          easymotion: vim motions on speed
    " Plug 'easymotion/vim-easymotion'
    "                                                                      tags
    " Plug 'vim-scripts/taglist.vim'
    " Plug 'ludovicchabant/vim-gutentags'
    "  						                     status bar
    " -------------------------------------------------------------------------
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'edkolev/tmuxline.vim'
    "  						                        various
    " -------------------------------------------------------------------------
    Plug 'tpope/vim-surround'
    Plug 'Konfekt/vim-CtrlXA'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-commentary'
    " matchit.vim, snipmate.vim, a.vim, 
    " Plug 'takac/vim-hardtime'
    " Plug 'tpope/vim-unimpaired'
    " Plug 'greyblake/vim-esperanto'
    Plug 'yuttie/comfortable-motion.vim'
    Plug 'mbbill/undotree'
    " Plug 'godlygeek/tabular'
    " Plug 'severin-lemaignan/vim-minimap'
    Plug 'voldikss/vim-floaterm'
    Plug 'townk/vim-autoclose'
    Plug 'vim-scripts/camelcasemotion'  " usage e.g.: ,w or ,b or ,e
    "                                                                       gtd
    " -------------------------------------------------------------------------
    Plug 'BlindFS/vim-taskwarrior'
    Plug 'evansalter/vim-checklist'
    Plug 'jceb/vim-orgmode'
    Plug 'tpope/vim-speeddating'
    Plug 'vimwiki/vimwiki'
    " Plug 'mattn/calendar-vim'
    Plug 'itchyny/calendar.vim'
    "  						                version control
    " -------------------------------------------------------------------------
    "                          very nice git plugin, everything from inside vim
    Plug 'tpope/vim-fugitive'
    "                                         extension of fugitive, compatible
    Plug 'gregsexton/gitv'                
    "                                       show git information in sign column
    Plug 'airblade/vim-gitgutter'
    "                                               show git status in NerdTree
    " Plug 'Xuyuanp/nerdtree-git-plugin'
    "  						                         visual
    " -------------------------------------------------------------------------
    "                                                              colorschemes
    Plug 'altercation/vim-colors-solarized'
    " Plug 'lifepillar/vim-solarized8'
    "                                                           syntax checking
    Plug 'dense-analysis/ale'
    " Plug 'maximbaz/lightline-ale'
    " Plug 'vim-syntastic/syntastic'
    "                                                       syntax highlighting
    " Plug 'sheerun/vim-polyglot'
    Plug 'machakann/vim-highlightedyank'
    "                   colorize everything that has the format #rgb or #rrggbb
    Plug 'chrisbra/colorizer'
    "                                                  show indentation markers
    Plug 'yggdroot/indentline'
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
