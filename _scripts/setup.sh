git clone git@github.com:emscripten-core/emsdk.git $CONF/emsdk
git clone git@github.com:ohmyzsh/ohmyzsh.git $CONF/zsh/oh-my-zsh
git clone git@github.com:alexanderjeurissen/ranger_devicons.git $CONF/ranger/plugins/ranger_devicons
git clone git@github.com:zsh-users/zsh-syntax-highlighting.git $CONF/zsh/oh-my-zsh/plugins/zsh-syntax-highlighting

nvim -c PlugInstall
