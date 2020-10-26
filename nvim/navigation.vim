
" =============================================================================
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
"                                                                        ranger
" =============================================================================
" deactivate default mapping (<leader>f)
let g:ranger_map_keys = 0 
" change default ranger command
let g:ranger_command_override = 'ranger --confdir=$CONF/ranger'

" }}}
