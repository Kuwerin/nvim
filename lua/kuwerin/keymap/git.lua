-- Git integration

local Remap = require("kuwerin.keymap.utils.remap")
local nnoremap = Remap.nnoremap

local silent = { silent = true }

nnoremap("<leader>gs", ":G status<CR>", silent)
nnoremap("<leader>gc", ":G commit<CR>", silent)
nnoremap("<leader>gA", ":G add ")
nnoremap("<leader>ga", ":G add %<CR>", silent)
nnoremap("<leader>gp", ":G push<CR>", silent)
nnoremap("<leader>gCo", ":G checkout ")
nnoremap("<leader>gd", ":Gdiffsplit<CR>", silent)
nnoremap("<leader>gD", ":Gdiffsplit ")
nnoremap("<leader>gB", ":GitBlameToggle<CR>", silent)
nnoremap("<leader>gb", ":lua require'telescope.builtin'.git_branches{}<CR>", silent)
nnoremap("<leader>gP", ":G pull<CR>")
nnoremap("<leader>v", ":G<CR>", silent)
