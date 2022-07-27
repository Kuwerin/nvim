-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- aerial setup
require('aerial').setup({
  backends = { "treesitter", "lsp", "markdown", "python", "go", "lua" },
  nerd_font = true,
  -- Show box drawing characters for the tree hierarchy
  show_guides = true,
  guides = {
    -- When the child item has a sibling below it
    mid_item = "├─",
    -- When the child item is the last in the list
    last_item = "└─",
    -- When there are nested child guides to the right
    nested_top = "│ ",
    -- Raw indentation
    whitespace = "  ",
  },
  filter_kind = false,
  float = {
    -- Controls border appearance. Passed to nvim_open_win
    border = "rounded",

    -- Enum: cursor, editor, win
    --   cursor - Opens float on top of the cursor
    --   editor - Opens float centered in the editor
    --   win    - Opens float centered in the window
    relative = "cursor",

    -- These control the height of the floating window.
    -- They can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
    -- min_height and max_height can be a list of mixed types.
    -- min_height = {8, 0.1} means "the greater of 8 rows or 10% of total"
    max_height = 0.9,
    height = nil,
    min_height = { 8, 0.2 },
    post_jump_cmd = "normal! zz",

    override = function(conf)
      -- This is the config that will be passed to nvim_open_win.
      -- Change values here to customize the layout
      return conf
    end,
  },
})
