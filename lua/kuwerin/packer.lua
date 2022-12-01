-- Module for store and  download dependencies

vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
  -- Packer itself
  use "wbthomason/packer.nvim"

  -- LSP/CMP
  use "neovim/nvim-lspconfig"
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "onsails/lspkind.nvim"

  -- LSP signature help
  use "ray-x/lsp_signature.nvim"

  -- LSP status
  use "j-hui/fidget.nvim"

  -- Python formatting
  use "smbl64/vim-black-macchiato"

  -- Git plugin
  use "tpope/vim-fugitive"
  use "f-person/git-blame.nvim"

  -- Syntax highlight/AST
  use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
  use "nvim-treesitter/nvim-treesitter-context"
  use "cespare/vim-toml"
--  use "ekalinin/Dockerfile.vim"
  use "elzr/vim-json"

  -- Snippets
  use "rafamadriz/friendly-snippets"
  use "saadparwaiz1/cmp_luasnip"
  use { "L3MON4D3/LuaSnip", after = "friendly-snippets" }

  -- Undo
  use "mbbill/undotree"

  -- Neotree
  use {
  "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    }
  }

  -- Aerial
  use "stevearc/aerial.nvim"

  -- Fuzzy search
  use "junegunn/fzf"
  use "junegunn/fzf.vim"

  -- Terminal
  use "numToStr/FTerm.nvim"

  -- Vim-go
  use "fatih/vim-go"

  -- Editorconfig
  use "editorconfig/editorconfig-vim"

  -- Auto brackets & pairs
  use "cohama/lexima.vim"
  use "tpope/vim-surround"

  -- Call Python NeoVim API for Wilder
  use {"roxma/nvim-yarp", run = ":UpdateRemotePlugins"} -- needs python3, boost, gettext to be installed, may need :UpdateRemotePlugins
  use "roxma/vim-hug-neovim-rpc"

  -- Wildmenu
  use "gelguy/wilder.nvim"

  -- SQL client
 use({ "kristijanhusak/vim-dadbod-ui", requires = {
   "tpope/vim-dadbod",
   "kristijanhusak/vim-dadbod-completion",
   "tpope/vim-dotenv",
  },
 })

  -- Visual
  use "nvim-tree/nvim-web-devicons"
  use "edkolev/tmuxline.vim"
  use "vim-airline/vim-airline"
  use "vim-airline/vim-airline-themes"

  -- Themes
  use "folke/tokyonight.nvim"
  use "morhetz/gruvbox"
  use "sainnhe/gruvbox-material"
  use "sainnhe/everforest"
  use "arcticicestudio/nord-vim"
  use "mhartington/oceanic-next"
  use "kaicataldo/material.vim"
  use "ayu-theme/ayu-vim"
  use "junegunn/seoul256.vim"
  use "doums/darcula"
end)

