-- Telescope

Telescope = require("telescope")

Telescope.load_extension('harpoon')

Telescope.setup{
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
