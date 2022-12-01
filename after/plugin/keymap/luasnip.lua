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

-- To prevent autocomplete after snippet done,
-- `goNext` function was mapped to the same keybind
-- as cmp.mapping.close
inoremap("<C-e>", "<cmd>lua goNext()<CR>")
