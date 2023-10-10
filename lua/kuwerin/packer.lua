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
  use "jose-elias-alvarez/nvim-lsp-ts-utils"

  -- LSP signature help
  use "ray-x/lsp_signature.nvim"

  -- Notifications
  use 'rcarriga/nvim-notify'

  -- Inlay hints
  use "lvimuser/lsp-inlayhints.nvim"

  -- LSP status
  use 'mrded/nvim-lsp-notify'

  -- Telescope
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-lua/popup.nvim",
      "nvim-telescope/telescope-fzy-native.nvim",
    }
  }

  -- Git plugin
  use "tpope/vim-fugitive"
  use "f-person/git-blame.nvim"

  -- Syntax highlight/AST
  use {"nvim-treesitter/nvim-treesitter", tag = "v0.9.1"}
  use "nvim-treesitter/nvim-treesitter-context"

  -- Snippets
  use "rafamadriz/friendly-snippets"
  use "saadparwaiz1/cmp_luasnip"
  use {
    "L3MON4D3/LuaSnip",
    after = {"friendly-snippets", "nvim-cmp"},
    config = function()
      require("luasnip").config.setup({ history = false })
      require("luasnip.loaders.from_vscode").load {}
    end,
  }

  -- Better quickfix
   use "kevinhwang91/nvim-bqf"

  -- Undo
  use "mbbill/undotree"

  -- Neotree
  use {
  "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    }
  }

  -- Aerial
  use "stevearc/aerial.nvim"

  -- Fuzzy search
  use "junegunn/fzf"
  use "junegunn/fzf.vim"

  -- Vim-go
  use "fatih/vim-go"

  -- Editorconfig
  use "editorconfig/editorconfig-vim"

  -- Auto brackets & pairs
  use "cohama/lexima.vim"
  use "tpope/vim-surround"

  -- Wildmenu
  use "gelguy/wilder.nvim"

  -- Bufferline
  use {'akinsho/bufferline.nvim', tag = "v3.*"}

  -- SQL client
  use({ "kristijanhusak/vim-dadbod-ui", requires = {
    "tpope/vim-dadbod",
    "kristijanhusak/vim-dadbod-completion",
    "tpope/vim-dotenv",
   },
  })

  -- Nvim-cURLy
  use "kuwerin/nvim-curly"

  -- Visual
  use "edkolev/tmuxline.vim"
  use "vim-airline/vim-airline"
  use "vim-airline/vim-airline-themes"

  -- Identation guides.
  use "lukas-reineke/indent-blankline.nvim"

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
  use "Mofiqul/vscode.nvim"
  use "catppuccin/nvim"
end)

