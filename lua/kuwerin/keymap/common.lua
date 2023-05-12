-- Editor keymaps


local Remap = require("kuwerin.keymap.utils.remap")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local vnoremap = Remap.vnoremap

local silent = { silent = true }

-- Base remaps
inoremap("jk", "<Esc>", silent)
inoremap("jK", "<Esc>", silent)
inoremap("JK", "<Esc>", silent)
inoremap("Jk", "<Esc>", silent)
nnoremap("zj", "o<Esc>k", silent)
nnoremap("zk", "O<Esc>j", silent)
nnoremap("<C-c>", "<C-a>", silent)
vnoremap("<C-c>", "<C-a>", silent)
nnoremap("<C-q>", "<Esc>:q!<CR>", silent)
nnoremap("<C-d>", "<C-d>zz", silent)
nnoremap("<C-u>", "<C-u>zz", silent)
nnoremap("n", "nzzzv", silent)
nnoremap("N", "Nzzzv", silent)
nnoremap("Q", "<nop>", silent)

-- LuaSnip
inoremap("<C-e>", "<cmd>lua require('luasnip').jump(1)<CR>")

-- Toggle helper pannels
nnoremap("<leader>p", ":NeoTreeShowToggle<CR>", silent)
nnoremap("<leader>b", ":NeoTreeShowToggle buffers<CR>", silent)
nnoremap("<leader>u", ":UndotreeToggle<CR>", silent)
nnoremap("<leader>s", ":AerialToggle right<CR>", silent)
nnoremap("<leader>d", ":DBUIToggle<CR>", silent)

-- Replace word with the word in register without
-- buffer update
xnoremap("<leader>p", "\"_dP")

-- Bufferline
nnoremap("<Tab>", "<cmd>bn<CR>",silent)
nnoremap("<S-Tab>", "<cmd>bp<CR>",silent)
nnoremap("<leader>x", "<cmd>:BufferLinePickClose<CR>",silent)
nnoremap("<leader>{", "<cmd>:BufferLineCloseLeft<CR>",silent)
nnoremap("<leader>}", "<cmd>:BufferLineCloseRight<CR>",silent)

-- Move between splits
nnoremap("<leader>h", ":wincmd h<CR>", silent)
nnoremap("<leader>j", ":wincmd j<CR>", silent)
nnoremap("<leader>k", ":wincmd k<CR>", silent)
nnoremap("<leader>l", ":wincmd l<CR>", silent)

-- Stop search highligting
nnoremap(",<leader>", ":nohlsearch<CR>", silent)

-- Toggle search case sensitivity
nnoremap("<leader>cs", ":set ic!<CR>", silent)

-- Fuzzy project search
nnoremap("<leader>fg", ":Telescope live_grep<CR>", silent)
nnoremap("<leader>ff", ":Telescope find_files<CR>", silent)
nnoremap("<leader>fb", ":Telescope buffers<CR>", silent)
nnoremap("<leader>fh", ":Telescope help_tags<CR>", silent)

-- Harpoon
nnoremap("<leader>1", ":lua require('harpoon.ui').nav_file(1)<CR>", silent)
nnoremap("<leader>2", ":lua require('harpoon.ui').nav_file(2)<CR>", silent)
nnoremap("<leader>3", ":lua require('harpoon.ui').nav_file(3)<CR>", silent)
nnoremap("<leader>4", ":lua require('harpoon.ui').nav_file(4)<CR>", silent)
nnoremap("<leader>tq", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", silent)
nnoremap("<leader>af", ":lua require('harpoon.mark').add_file()<CR>", silent)

-- Worktree
nnoremap("<leader>fw", ":lua require('telescope').extensions.git_worktree.git_worktrees()<CR>", silent)
nnoremap("<leader>cw", ":lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>", silent)

-- NVim-curly
nnoremap("<S-r>", ":lua require('nvim-curly').execute_line()<CR>", silent)
xnoremap("<S-r>", ":lua require('nvim-curly').execute_multiline()<CR>", silent)
vnoremap("<S-r>", ":lua require('nvim-curly').execute_multiline()<CR>", silent)
nnoremap("<leader>ch", ":lua require('nvim-curly').go_to_history()<CR>", silent)
nnoremap("<leader>cd", ":lua require('nvim-curly').go_to_workspace_root()<CR>", silent)

-- Relative number toggle
nnoremap("<leader>n", "<cmd>set rnu!<CR>", silent)

-- Go linter autosave toggle
nnoremap("<leader>al", "<cmd>:GoMetaLinterAutoSaveToggle<CR>", silent)
nnoremap("<leader>rl", "<cmd>:GoMetaLinter<CR>", silent)

-- Move visual block up and down
vnoremap("J", ":m  '>+1<CR>gv=gv")
vnoremap("K", ":m  '<-2<CR>gv=gv")

-- System buffer integration
nnoremap("<leader>y", "\"+y")
vnoremap("<leader>y", "\"+y")
nnoremap("<leader>Y", "\"+Y")

-- Escape remap for insert after visual block
inoremap("<C-c>", "<Esc>")

-- Replace word under the cursor
nnoremap("<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
