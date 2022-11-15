-- LuaSnip keymaps

local luasnip = require 'luasnip'

local Remap = require("kuwerin.utils.keymap")
local inoremap = Remap.inoremap

local silent = { silent = true }

function goNext()
	if luasnip.jumpable(1) then
		luasnip.jump(1)
	end
end

inoremap("<C-n>", "<cmd>lua goNext()<CR>")
