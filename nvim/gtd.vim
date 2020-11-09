" au BufNewFile $DROPBOX/vimwiki/diary/*.wiki :silent 0r !$CONF/nvim/bin/generate_vimwiki_diary_template '%'

let g:vimwiki_list = [{'path': '$DROPBOX/vimwiki'}]
let g:taskwiki_taskrc_location = '$TASKRC'
let g:taskwiki_data_location = '~/Public/Dropbox/taskwarrior'
let taskwiki_data_location = '~/Public/Dropbox/taskwarrior'

map <leader>wu :edit $WIKI/gtd/projects/physics_msc/main.wiki<CR>
map <leader>wp :edit $WIKI/gtd/projects/main.wiki<CR>
map <leader>wn :edit $WIKI/gtd/todos.wiki<CR>
map <leader>wi :edit $WIKI/gtd/inbox/main.wiki<CR>
map <leader>ws :edit $WIKI/skills/main.wiki<CR>
map <leader>wl :edit $WIKI/library/main.wiki<CR>
