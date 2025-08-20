local lspconfig = require 'lspconfig'
local on_attach = require 'kuwerin.utils'.on_attach
local lsp_setup = require 'kuwerin.utils'.lsp_setup

-- Common LSP setup
local servers = {'pyright',  'pls', 'elixirls'}
for _, lsp in ipairs(servers) do
  lsp_setup(lsp, {
    flags = {
      debounce_text_changes = 150,
    }
  })
end

-- Go Pls specific setup. For API information use `gopls api-json`
lspconfig.gopls.setup {
    cmd = {'gopls', 'serve'},
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
