# dotfiles

### Setup:

* zsh
    * install zsh

        yay -S zsh

    * install oh-my-zsh 
        sh -c "$(curl https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    * install zsh-syntax-highlighting
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
        -> move repo to $CONF/zsh/oh-my-zsh/plugins

* tmux
    * install tmux
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
    * make vim bin scripts executable
    * install python requirements
    * install tasklib for taskwiki
        * cd into plugged/taskwiki
        * pip3 install -r requirements

* x server
    * xinitrc
    * install xcompmgr
    * source xinitrc from /etc/xdg/xfce4/xinitrc

* dwm 
    * download & compile from source
    * install patches
        * bar-height
        * bottomstack
        * centretitle
        * combo
        * fibonacci
        * uselessgap

* st 
    * download & compile from source
    * install patches
        * alpha
        * anygeometry
        * anysize
        * clipboard
        * vimBrowse ?

* ranger
    * download devicons
    * download image preview package

* tex
    * on manjaro
        * texlive-most
        * latex-mk
    * on mac
        * macTex
        * latex-mk

* other packages (e.g. from AUR, npm, pip or homebrew)
    * AUR
        * task, tasksh, timew
        * lsd
        * fzf
        * ripgrep (rg), needed for fzf-preview
        * top/gtop
        * neomutt
        * ytdl, rtv
        * colordiff
        * colorpicker
        * ncdu, tldr
        * sl, cmatrix, cowsay, fortune
    * npm
        * weather-cli, emoji-finder, nasa-cli, cli-fireplace, carbon-now-cli
    * pip3
        * ricksay, YuleLog
    * various / as of yet uncategorized
        * dropbox
        * pipes.sh
        * s (search)
        * mdv (markdown viewer)
        * pass (pw manager)
        * sxiv
        * bpython, mycli
