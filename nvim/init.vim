
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
source $XDG_CONFIG_HOME/nvim/nerdtree.vim

" source $XDG_CONFIG_HOME/nvim/ale.vim
" source $XDG_CONFIG_HOME/nvim/gtd.vim

" autocmd vimenter * FZF
