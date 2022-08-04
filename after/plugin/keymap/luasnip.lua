local luasnip = require 'luasnip'

local Remap = require("kuwerin.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap

local silent = { silent = true }

function goNext()
	if luasnip.jumpable(1) then
		luasnip.jump(1)
	end
end

inoremap("<C-n>", "<cmd>lua goNext()<CR>")
