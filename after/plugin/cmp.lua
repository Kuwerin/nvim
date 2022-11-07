local lspkind = require 'lspkind'
local luasnip = require 'luasnip'
local cmp = require 'cmp'

require('luasnip.loaders.from_vscode').load({
       paths = { '~/.local/share/nvim/site/pack/packer/start/friendly-snippets' }
      })

require('luasnip.loaders.from_lua').load({
  paths = {'~/.config/nvim/snippets'}
})

luasnip.config.set_config({
  history = true,
  updateevents = "TextChanged,TextChangedI",
  enable_autosnippets = true,
})

cmp.setup {
  window = {
    completion = { -- rounded border; thin-style scrollbar
      border = 'rounded',
      scrollbar = '║',
    },
    documentation = { -- no border; native-style scrollbar
      border = 'rounded',
      scrollbar = '║',
    },
  },
   formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol', -- show only symbol annotations
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
    }),
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-P>'] = cmp.mapping.select_prev_item(),
    ['<C-N>'] = cmp.mapping.select_next_item(),
    ['<C-D>'] = cmp.mapping.scroll_docs(-4),
    ['<C-F>'] = cmp.mapping.scroll_docs(4),
    ['<C-SPACE>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<TAB>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
    ['<S-TAB>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}
