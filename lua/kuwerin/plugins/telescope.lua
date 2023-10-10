-- Telescope

local telescope = require('telescope')

telescope.load_extension('notify')

telescope.setup{
  pickers = {
    find_files = {
      theme = PREF.ui.telescope.default_theme,
    },
    live_grep = {
      theme = PREF.ui.telescope.default_theme,
    },
    buffers = {
      theme = PREF.ui.telescope.default_theme,
    },
  },
}
