local lspconfig = require 'lspconfig'
local configs = require 'lspconfig.configs'
local tsutils = require('nvim-lsp-ts-utils')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  if client.server_capabilities.inlayHintProvider then
    vim.g.inlay_hints_visible = true
    vim.lsp.inlay_hint.enable()
  else
    print("no inlay hints available")
  end

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap=true, silent=true }
  vim.diagnostic.config({
    float = {
      source = 'always',
      border = PREF.ui.border,
    },
  })

end

-- Check if it's already defined for when reloading this file.
if not configs.pls then
    configs.pls = {
        default_config = {
            cmd = {'pls'},
            filetypes = {'proto'},
            root_dir = lspconfig.util.root_pattern('.git'),
            -- root_dir = function(fname)
            --     return lspconfig.util.find_git_ancestor(fname) or
            --     vim.loop.os_homedir()
            -- end,
            settings = {}
        }
    }
end

-- Common LSP setup
local servers = {'pyright', 'lua_ls', 'pls'}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

-- Tsserver
lspconfig.tsserver.setup{
  cmd = {"typescript-language-server", "--stdio"},
  root_dir = lspconfig.util.root_pattern("package.json"),
  on_attach=function(c,b)
    tsutils.setup({ filter_out_diagnostics_by_code = { 80001 }})
    tsutils.setup_client(c)
    on_attach(c,b)
  end,
}

-- Go Pls specific setup. For API information use `gopls api-json`
lspconfig.gopls.setup {
    cmd = {"gopls", "serve"},
    settings = {
      gopls = {
        hints = {
          assignVariableTypes = true,
          compositeLiteralFields = true,
          compositeLiteralTypes = true,
          constantValues = true,
          functionTypeParameters = true,
          parameterNames = true,
          rangeVariableTypes = true,
        },
        analyses = {
          composites=false,
        },
        staticcheck = true,
      },
    },
    on_attach=on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }

-- Clangd specific setup.
lspconfig.clangd.setup{
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
}

-- LSP always-show signature
require("noice").setup({
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
    },
  },
    views = {
      cmdline_popup = {
        position = {
          row = 5,
          col = "50%",
        },
        size = {
          width = 60,
          height = "auto",
        },
      },
      popupmenu = {
        relative = "editor",
        position = {
          row = 8,
          col = "50%",
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
          winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
        },
    },
  },
    cmdline = {
      format = {
        search_down = {
          view = "cmdline",
        },
        search_up = {
          view = "cmdline",
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
