return require("packer").startup(function() 
    use "wbthomason/packer.nvim"

    use "tpope/vim-surround"
    use "tpope/vim-commentary"
    use "tpope/vim-fugitive"

    use { "neoclide/coc.nvim", branch="release" }

    use { "nvim-telescope/telescope.nvim", 
        requires = {
            "nvim-lua/plenary.nvim"
        }
    }

    use "machakann/vim-highlightedyank"

    use "wellle/tmux-complete.vim"
    use "christoomey/vim-tmux-navigator"

    use "altercation/vim-colors-solarized"
    use "ryanoasis/vim-devicons"

    use "junegunn/goyo.vim"
    use "junegunn/limelight.vim"
end)
