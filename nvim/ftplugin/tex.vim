" ALEDisable

" deletes aux tex files (build files) when closing editor
augroup vimtex_config
    au!
    au User VimtexEventQuit call vimtex#compiler#clean(0)
augroup END

inoremap $ $$<left>

let g:tex_conceal = ''
