local nnoremap = require 'kuwerin.keymap.utils.remap'.nnoremap

local M = {}

M.on_attach = function(client, bufnr)
  nnoremap('gd', ':lua vim.lsp.buf.definition()<CR>')
  nnoremap('gr', ':lua vim.lsp.buf.references()<CR>')
  nnoremap('<leader>rn', ':lua vim.lsp.buf.rename()<CR>')

  if client.server_capabilities.inlayHintProvider then
    vim.g.inlay_hints_visible = true
    vim.lsp.inlay_hint.enable()
  else
    print('no inlay hints available')
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

-- This function will use the "legacy setup" on older Neovim version.
-- The new api is only available on Neovim v0.11 or greater.
M.lsp_setup = function(server, opts)
  if vim.fn.has('nvim-0.11') == 0 then
    lspconfig[server].setup(opts)
    return
  end

  if not vim.tbl_isempty(opts) then
    vim.lsp.config(server, opts)
  end

  vim.lsp.enable(server)
end
-- Declare global function to carriage return action in popup.
_G.cr_action = function()
  -- If there is selected item in popup, accept it with <C-y>
  if vim.fn.complete_info()['selected'] ~= -1 then return '\25' end
  -- Fall back to plain `<CR>`. You might want to customize according
  -- to other plugins. For example if 'mini.pairs' is set up, replace
  -- next line with `return MiniPairs.cr()`
  return '\r'
end

return M
