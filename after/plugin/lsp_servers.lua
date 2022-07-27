local nvim_lsp = require('lspconfig')
local servers = {'pyright', 'rust_analyzer', 'gopls', 'clangd'}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
