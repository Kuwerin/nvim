-- LSP visualization setup.
local noice = require'noice'

noice.setup({
  lsp = {
    override = {
      ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
      ['vim.lsp.util.stylize_markdown'] = true,
      ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
    },
  },
    views = {
      cmdline_popup = {
        position = {
          row = 5,
          col = '50%',
        },
        size = {
          width = 60,
          height = 'auto',
        },
      },
      popupmenu = {
        relative = 'editor',
        position = {
          row = 8,
          col = '50%',
        },
        size = {
          width = 60,
          height = 10,
        },
        border = {
          style = PREF.ui.border,
          padding = { 0, 1 },
        },
        win_options = {
          winhighlight = { Normal = 'Normal', FloatBorder = 'DiagnosticInfo' },
        },
    },
  },
    cmdline = {
      format = {
        search_down = {
          view = 'cmdline',
        },
        search_up = {
          view = 'cmdline',
        },
      },
    },
   hover = {
      enabled = true,
      border = PREF.ui.border,
    },
    messages = {
    -- NOTE: If you enable messages, then the cmdline is enabled automatically.
    -- This is a current Neovim limitation.
      enabled = false, -- enables the Noice messages UI
  },
  presets = {
    bottom_search = true, -- use a classic bottom cmdline for search
    command_palette = true,
    long_message_to_split = true, -- long messages will be sent to a split
    lsp_doc_border = PREF.ui.border, -- add a border to hover docs and signature help
  },
})
