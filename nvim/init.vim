
" =============================================================================
" 				  neovim init.vim
" =============================================================================

"                                                                   leader keys
" -----------------------------------------------------------------------------
let mapleader="\<space>"
let maplocalleader ="\<tab>"

"                                                                       plugins
" -----------------------------------------------------------------------------

filetype indent plugin on

source $CONF/nvim/plugins.vim

"                                                                        config
" -----------------------------------------------------------------------------

source $CONF/nvim/functions.vim
source $CONF/nvim/mappings.vim

source $CONF/nvim/appearance.vim
source $CONF/nvim/completion.vim
source $CONF/nvim/folds.vim
source $CONF/nvim/general.vim
source $CONF/nvim/navigation.vim
source $CONF/nvim/statusbar.vim
source $CONF/nvim/version_control.vim

" source $CONF/nvim/ale.vim
source $CONF/nvim/coc.vim
source $CONF/nvim/fzf.vim
source $CONF/nvim/nerdtree.vim

source $CONF/nvim/gtd.vim
