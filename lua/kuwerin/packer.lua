vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'folke/tokyonight.nvim'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'
  use 'tpope/vim-fugitive'
  use 'mbbill/undotree'
  use 'cespare/vim-toml'
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'scrooloose/nerdtree'
end)

