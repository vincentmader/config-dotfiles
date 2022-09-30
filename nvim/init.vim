
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

source $XDG_CONFIG_HOME/nvim/plugins.vim

"                                                                        config
" -----------------------------------------------------------------------------

source $XDG_CONFIG_HOME/nvim/appearance.vim
source $XDG_CONFIG_HOME/nvim/completion.vim
source $XDG_CONFIG_HOME/nvim/general.vim
source $XDG_CONFIG_HOME/nvim/mappings.vim
source $XDG_CONFIG_HOME/nvim/navigation.vim
source $XDG_CONFIG_HOME/nvim/statusbar.vim
source $XDG_CONFIG_HOME/nvim/version_control.vim

source $XDG_CONFIG_HOME/nvim/fzf.vim
source $XDG_CONFIG_HOME/nvim/nerdtree.vim

" source $XDG_CONFIG_HOME/nvim/ale.vim
" source $XDG_CONFIG_HOME/nvim/gtd.vim

" autocmd vimenter * FZF
