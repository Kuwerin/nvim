-- Git integration
local Remap = require("kuwerin.keymap")
local nnoremap = Remap.nnoremap

local silent = { silent = true }

nnoremap("<leader>gs", ":Git status<CR>", silent)
nnoremap("<leader>gc", ":Git commit<CR>", silent)
nnoremap("<leader>ga", ":Git add ")
nnoremap("<leader>gA", ":Git add %<CR>", silent)
nnoremap("<leader>gp", ":Git push<CR>", silent)
nnoremap("<leader>gCo", ":Git checkout ")
nnoremap("<leader>gd", ":Gdiffsplit<CR>", silent)
nnoremap("<leader>gD", ":Gdiffsplit ")
nnoremap("<leader>gb", ":Git blame<CR>", silent)
nnoremap("<leader>gB", ":Git blame ")
nnoremap("<leader>gP", ":Git pull<CR>")
