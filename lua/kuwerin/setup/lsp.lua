local nvim_lsp = require('lspconfig')

local border = 'rounded'

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap=true, silent=true }
  vim.diagnostic.config({
    float = {
      source = 'always',
      border = border,
    },
  })

    vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
        vim.lsp.handlers.hover, {
          border = border,
          scrollbar = '║',
          source = 'always',
          }
      )
end

-- Common LSP setup
local servers = {'pyright', 'rust_analyzer', 'gopls', 'clangd', 'sumneko_lua'}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

-- Go Pls specific setup. For API information use gopls api-json
nvim_lsp.gopls.setup {
    cmd = {"gopls", "serve"},
    settings = {
      gopls = {
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

-- LSP always-show signature
require "lsp_signature".setup({
  bind = true, -- This is mandatory, otherwise border config won't get registered.
  handler_opts = {
    border = border,
  },
  hint_prefix = " ",
})
