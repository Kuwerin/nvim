-- Module for store and  download dependencies

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer itself
  use 'wbthomason/packer.nvim'

  -- LSP/CMP
  use 'neovim/nvim-lspconfig'
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'L3MON4D3/LuaSnip', -- Required for snippets
      'saadparwaiz1/cmp_luasnip', -- nvim-cmp source for LuaSnip
      'hrsh7th/cmp-nvim-lsp', -- nvim-cmp source for LSP
      'hrsh7th/cmp-buffer', -- nvim-cmp source for buffer words
      'hrsh7th/cmp-path', -- nvim-cmp source for file paths
      'onsails/lspkind.nvim'
    }
  }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-lua/popup.nvim',
      'nvim-telescope/telescope-fzy-native.nvim',
    }
  }

  -- Git integration
  use 'tpope/vim-fugitive'
  use 'f-person/git-blame.nvim'

  -- Syntax highlight/AST
  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-treesitter/nvim-treesitter-context'

  -- Better quickfix
   use 'kevinhwang91/nvim-bqf'

   -- Undotree
  use 'mbbill/undotree'

  -- Neotree
  use {
  'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
    requires = {
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      'nvim-tree/nvim-web-devicons',
    }
  }

  -- Aerial
  use 'stevearc/aerial.nvim'

  -- Go integration
  use 'fatih/vim-go'

  -- Editorconfig
  use 'editorconfig/editorconfig-vim'

  -- Auto brackets & pairs
  use 'cohama/lexima.vim'
  use 'tpope/vim-surround'

  -- Nvim-cURLy
  use 'kuwerin/nvim-curly'

  -- Bufferline
  use 'akinsho/bufferline.nvim'

  --
  --
  -- Visual

  -- LSP signature help
  use 'folke/noice.nvim'

  -- Notifications
  use {'rcarriga/nvim-notify', tag = 'v3.14.0'}

  -- Themes
  use 'folke/tokyonight.nvim'
  use 'morhetz/gruvbox'
  use 'sainnhe/gruvbox-material'
  use 'sainnhe/everforest'
  use 'arcticicestudio/nord-vim'
  use 'mhartington/oceanic-next'
  use 'kaicataldo/material.vim'
  use 'ayu-theme/ayu-vim'
  use 'junegunn/seoul256.vim'
  use 'doums/darcula'
  use 'Mofiqul/vscode.nvim'
  use 'catppuccin/nvim'

end)

