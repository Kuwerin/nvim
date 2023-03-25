local lspconfig = require('lspconfig')

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
      border = PREF.ui.border,
    },
  })

    vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
        vim.lsp.handlers.hover, {
          border = PREF.ui.border,
          scrollbar = PREF.ui.scrollbar,
          source = 'always',
          }
      )
end

-- Common LSP setup
local servers = {'pyright', 'rust_analyzer', 'gopls', 'solargraph', 'lua_ls'}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

-- Go Pls specific setup. For API information use `gopls api-json`
lspconfig.gopls.setup {
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

-- Clangd specific setup.
require'lspconfig'.clangd.setup{
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
}

-- LSP always-show signature
require "lsp_signature".setup({
  bind = true, -- This is mandatory, otherwise border config won't get registered.
  handler_opts = {
    border = PREF.ui.border,
  },
  hint_prefix = " ",
})
