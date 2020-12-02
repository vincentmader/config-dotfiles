# dotfiles

%% ## Preparations

%%     * create a new disk partition
%%     * prepare a bootable Arch installation medium
%%     * boot into that medium

%% ## install Arch essentials

%%     * verify boot mode
    
%%             ls /sys/firmware/efi/efivars

%%     * connect to the internet
    
%%             iwctl
            
%%             [iwd]# station wlan0 get-networks
%%             [iwd]# station wlan0 connect <network-name>
    
%%             ping google.com

%%     * update pacman's AUR keyring & mirrors; then run system upgrade
    
%%             sudo pacman -Sy archlinux-keyring
%%             sudo pacman -Sy
%%             sudo pacman -Syu

%%     * Partition the disks & create the following two partitions: a small 
%%       (~200M) "Linux swap" partition and a big "Linux root (x86-64)" partition. 
    
%%             sudo cfdisk

%%     * format the partitions
        
%%             mkfs.ext4 /dev/<root_partition>
%%             mkswap /dev/<swap_partition>
    
%%     * mount the file systems
        
%%             mount /dev/<root_partition>
%%             swapon /dev/<swap_partition>

    
%%     * pacstrap
%%     * create users
%%     * follow Arch wiki installation guide

%% ## setup dev env inside Arch




* zsh
    * install zsh

            yay -S zsh

    * install oh-my-zsh 

            sh -c "$(curl https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    * install zsh-syntax-highlighting

            git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $CONF/zsh/oh-my-zsh/plugins/zsh-syntax-highlighting

* tmux
    * install tmux
    
            yay -S tmux 
    
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
    
            chmod +x ./nvim/bin/*
        
    * install python requirements
    
            pip3 install ./nvim/requirements.txt 
        
    * install tasklib for taskwiki

            cd ./nvim/plugged/taskwiki
            pip3 install -r requirements

* x server
    * source ./x/xinitrc from ~/.xinitrc

* dwm 
    * download & compile from source
    
            git clone https://git.suckless.org/dwm
    
    * install patches
        * bar-height
        * bottomstack
        * centretitle
        * combo
        * fibonacci
        * uselessgap

* st 
    * download & compile from source

            git clone https://git.suckless.org/st

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
        * install texlive-most
    * on mac
        * install macTex
    * install latex-mk (for vimtex)

* other packages (e.g. from AUR, npm, pip or homebrew)
    * AUR
        * task, tasksh, timew
        * lsd
        * fzf
        * ncdu
        * ripgrep (rg), needed for fzf-preview
        * top/gtop
        * neomutt
        * rtv
        * colordiff
        * colorpicker
        * ncdu, tldr
        * sl, cmatrix, cowsay, fortune
        * figlet, toilet
        * xclip, xsel ? x... ?
        * xbindkeys
        * xcompmgr
	* alsa-utils, imagemagick
        * wget
        * mpv
        * pandoc
        * zip, unzip, tar
    * npm
        * weather-cli, nasa-cli
        * cli-fireplace, carbon-now-cli
        * emoji-finder
    * pip3
        * ricksay, YuleLog
        * rope, pep8, autopep8
    * various / as of yet uncategorized
        * dropbox
        * pipes.sh
        * s (search)
        * mdv (markdown viewer)
        * pass (pw manager)
        * sxiv
        * bpython, mycli
        * ytdl
