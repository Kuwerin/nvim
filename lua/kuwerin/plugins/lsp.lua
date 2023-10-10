local lspconfig = require 'lspconfig'
local configs = require 'lspconfig.configs'
local tsutils = require('nvim-lsp-ts-utils')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  if client.server_capabilities.inlayHintProvider then
    vim.g.inlay_hints_visible = true
    vim.lsp.inlay_hint(bufnr, true)
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

    vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
        vim.lsp.handlers.hover, {
          border = PREF.ui.border,
          scrollbar = PREF.ui.scrollbar,
          source = 'always',
          }
      )
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
local servers = {'pyright', 'solargraph', 'lua_ls', 'pls'}
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
    on_attach=function (c,b)
      require("lsp-inlayhints").on_attach(c, b)
      on_attach(c,b)
    end,
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
require "lsp_signature".setup({
  bind = true, -- This is mandatory, otherwise border config won't get registered.
  handler_opts = {
    border = PREF.ui.border,
  },
  hint_prefix = " ",
  hint_enable = false,
})
