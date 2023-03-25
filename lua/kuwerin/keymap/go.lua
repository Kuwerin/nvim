-- Go language keymaps

local Remap = require("kuwerin.keymap.utils.remap")
local nnoremap = Remap.nnoremap

local silent = { silent = true }

nnoremap("<leader>tf", ":GoTestFunc<CR>", silent)
nnoremap("<leader>tm", ":GoTest<CR>", silent)
nnoremap("<leader>ie", ":GoIfErr<CR>", silent)
