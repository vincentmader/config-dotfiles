" TODO: write script that deletes tex build files
" autocmd VimLeave *tex !texclear %
augroup vimtex_config
    au!
    au User VimtexEventQuit call vimtex#compiler#clean(0)
augroup END

inoremap $ $$<left>
