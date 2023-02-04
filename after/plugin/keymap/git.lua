-- Git integration

local Remap = require("kuwerin.utils.keymap")
local nnoremap = Remap.nnoremap

local silent = { silent = true }

nnoremap("<leader>gs", ":Git status<CR>", silent)
nnoremap("<leader>gc", ":Git commit<CR>", silent)
nnoremap("<leader>gA", ":Git add ")
nnoremap("<leader>ga", ":Git add %<CR>", silent)
nnoremap("<leader>gp", ":Git push<CR>", silent)
nnoremap("<leader>gCo", ":Git checkout ")
nnoremap("<leader>gd", ":Gdiffsplit<CR>", silent)
nnoremap("<leader>gD", ":Gdiffsplit ")
nnoremap("<leader>gB", ":GitBlameToggle<CR>", silent)
nnoremap("<leader>gb", ":lua require'telescope.builtin'.git_branches{}<CR>", silent)
nnoremap("<leader>gP", ":Git pull<CR>")
