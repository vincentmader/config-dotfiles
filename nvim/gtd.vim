" au BufNewFile $DROPBOX/vimwiki/diary/*.wiki :silent 0r !$CONF/nvim/bin/generate_vimwiki_diary_template '%'

let g:vimwiki_list = [{'path': '$DROPBOX/vimwiki'}]
let g:taskwiki_taskrc_location = '$TASKRC'
let g:taskwiki_data_location = '~/Public/Dropbox/taskwarrior'
let taskwiki_data_location = '~/Public/Dropbox/taskwarrior'
