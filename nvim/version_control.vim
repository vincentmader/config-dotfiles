
" =============================================================================
"                                VERSION CONTROL
" =============================================================================

"                                                                       general
" -----------------------------------------------------------------------------
"                                                           turn off swap files
set noswapfile
set nobackup
set nowritebackup

"                                                                      vim undo
" -----------------------------------------------------------------------------
" undo history across sessions, by storing in file. only works all the time.
if has('persistent_undo')
    silent !mkdir $HOME/.config/nvim/backups > /dev/null 2>&1
    set undodir=$HOME/.config/nvim/backups
    set undofile
endif

"                                                                           git
" -----------------------------------------------------------------------------
" TODO: setup
