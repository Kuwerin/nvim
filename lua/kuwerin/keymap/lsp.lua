-- LSP keymaps

local Remap = require("kuwerin.keymap.utils.remap")
local nnoremap = Remap.nnoremap

nnoremap('gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
nnoremap('gd', '<cmd>Glance definitions<CR>', opts)
nnoremap('K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
nnoremap('gi', '<cmd>Glance implementations<CR>', opts)
nnoremap('<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
nnoremap('<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
nnoremap('<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
nnoremap('<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
nnoremap('<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
nnoremap('<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
nnoremap('gr', '<cmd>Glance references<CR>', opts)
nnoremap('<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
nnoremap('[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
nnoremap(']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
nnoremap('<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
nnoremap('<leader>F', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
