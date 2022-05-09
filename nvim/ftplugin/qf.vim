"                                   automatically adjust quickfix window height
" -----------------------------------------------------------------------------
augroup quickfix_autocmds
  autocmd!
  autocmd BufReadPost quickfix call AdjustWindowHeight(2, 5)
augroup END

function! AdjustWindowHeight(minheight, maxheight)
  execute max([a:minheight, min([line('$') + 1, a:maxheight])])
        \ . 'wincmd _'
endfunction

" set numbers
