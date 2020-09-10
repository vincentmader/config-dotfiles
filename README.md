# dotfiles

Setup:

    * tmux
        * install tmux package manager via
            git clone https://github.com/tmux-plugins/tpm $CONF/tmux/plugins/tpm
        * install plugins with 
            prefix + I
        
    * vim
        * install vimplug (this should be done automatically at vim startup) via
            curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        * install all other plugins with
            :PlugInstall 
    
