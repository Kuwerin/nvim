local vscode = require 'vscode'
vscode.setup({
  transparent = false,
  italic_comments = PREF.ui.italic,
  disable_nvimtree_bg = false,
  color_overrides = {},
  group_overrides = {},
})

vim.g.airline_theme='everforest'
