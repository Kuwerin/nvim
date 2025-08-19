local colorscheme = PREF.ui.colorscheme

local source = {
  catppuccin = 'catppuccin',
  everforest = 'everforest',
  tokyonight = 'tokyonight',
  darcula = 'darcula',
  vscode = 'vscode',
  gruvbox = 'gruvbox',
  ['gruvbox-material'] = 'gruvbox-material',
}

local config = source[colorscheme]

if config then
  pcall(require, 'kuwerin.colorscheme.' .. config)
end

local present, _ = pcall(vim.cmd.colorscheme, colorscheme)

if not present then
  vim.cmd.colorscheme('catppuccin')
end
