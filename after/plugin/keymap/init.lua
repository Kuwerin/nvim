-- Editor keymaps

local Remap = require("kuwerin.utils.keymap")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local vnoremap = Remap.vnoremap

require("kuwerin.utils.curl")
require("kuwerin.utils.evans")

local silent = { silent = true }

-- Base remaps
inoremap("jk", "<Esc>", silent)
inoremap("jK", "<Esc>", silent)
inoremap("JK", "<Esc>", silent)
inoremap("Jk", "<Esc>", silent)
nnoremap("zj", "o<Esc>k", silent)
nnoremap("zk", "O<Esc>j", silent)
nnoremap("<C-c>", "<C-a>", silent)
nnoremap("<C-q>", "<Esc>:q!<CR>", silent)
nnoremap("<C-d>", "<C-d>zz", silent)
nnoremap("<C-u>", "<C-u>zz", silent)
nnoremap("n", "nzzzv", silent)
nnoremap("N", "Nzzzv", silent)
nnoremap("Q", "<nop>", silent)

-- Toggle helper pannels
nnoremap("<leader>p", ":NeoTreeShowToggle<CR>", silent)
nnoremap("<leader>v", ":NeoTreeShowToggle git_status<CR>", silent)
nnoremap("<leader>b", ":NeoTreeShowToggle buffers<CR>", silent)
nnoremap("<leader>u", ":UndotreeToggle<CR>", silent)
nnoremap("<leader>s", ":AerialToggle right<CR>", silent)
nnoremap("<leader>d", ":DBUIToggle<CR>", silent)

-- Replace word with the word in register without
-- buffer update
xnoremap("<leader>p", "\"_dP")

-- Move between windows
nnoremap("<leader>h", ":wincmd h<CR>", silent)
nnoremap("<leader>j", ":wincmd j<CR>", silent)
nnoremap("<leader>k", ":wincmd k<CR>", silent)
nnoremap("<leader>l", ":wincmd l<CR>", silent)

-- Stop search highligting
nnoremap(",<leader>", ":nohlsearch<CR>", silent)

-- Toggle search case sensitivity
nnoremap("<leader>cs", ":set ic!<CR>", silent)

-- Fuzzy project search
nnoremap("<leader>f", ":Rg<CR>", silent)

-- Execute curl responses and get the response data
nnoremap("<S-r>", "<cmd>lua callCurl()<CR>", silent)

-- Get curl history
nnoremap("<leader>ch", ":e $CURL_HISTORY_DIR<CR>")

-- Execute evans gRPC responses
nnoremap("<S-x>", "<cmd>lua callEvans()<CR>", silent)

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

nnoremap("<leader>d", "\"_d")
vnoremap("<leader>d", "\"_d")

-- Escape remap for insert after visual block
inoremap("<C-c>", "<Esc>")

-- Replace word under the cursor
nnoremap("<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
