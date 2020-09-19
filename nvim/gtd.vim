au BufNewFile $DROPBOX/vimwiki/diary/*.wiki :silent 0r !$CONF/nvim/bin/generate_vimwiki_diary_template '%'
