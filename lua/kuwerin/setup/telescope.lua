-- Telescope

Telescope = require("telescope")

Telescope.load_extension("git_worktree")
Telescope.load_extension('harpoon')

Telescope.setup{
  pickers = {
    find_files = {
      theme = "dropdown",
    },
    live_grep = {
      theme = "dropdown",
    },
    buffers = {
      theme = "dropdown",
    },
  },
}
