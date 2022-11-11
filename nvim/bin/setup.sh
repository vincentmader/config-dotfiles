#!/bin/sh

#   Create `$XDG_CACHE_HOME/nvim` directory.
    mkdir -p $XDG_CACHE_HOME/nvim
#   -> This defines the save location for the nvim `log` file.

#   Create `$XDG_DATA_HOME/nvim` directory.
    mkdir -p $XDG_DATA_HOME/nvim
#   -> This defines the location for 
#      - the `backups` directory,
#      - the `shada` directory,                      <- TODO: Get this to work!
#      - the `site/autoload/plug.vim` package manager, &
#      - the `plugged` directory containing plugin data.
#   -> If this is not created manually, nvim will 
#      auto-create a `nvim/log` directory & file EVERYWHERE.

#   Create `$XDG_DATA_HOME/nvim/shada` directory.
    mkdir -p $XDG_DATA_HOME/nvim/shada
#   -> This defines the save location for the nvim `shada` directory.
#      TODO: Fix: This is not working at the moment.
#   -> If this is not created manually, nvim will 
#      auto-create a `nvim/shada/main.shada` directory & file EVERYWHERE.

#   Install python dependencies for neovim.
    pip3 install -r ../requirements.txt
