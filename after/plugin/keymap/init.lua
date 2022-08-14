-- Editor keymaps

local Remap = require("kuwerin.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap

require("kuwerin.utils.curl")
require("kuwerin.utils.evans")

local silent = { silent = true }

-- Base remaps
inoremap("jk", "<Esc>")
inoremap("jK", "<Esc>")
inoremap("JK", "<Esc>")
inoremap("Jk", "<Esc>")
nnoremap("zj", "o<Esc>k")
nnoremap("zk", "O<Esc>j")
nnoremap("<C-c>", "<C-a>")

-- Toggle helper pannels
nnoremap("<leader>p", ":NERDTreeToggle<CR>", silent)
nnoremap("<leader>u", ":UndotreeToggle<CR>", silent)
nnoremap("<leader>s", ":AerialToggle right<CR>", silent)
nnoremap("<leader>d", ":DBUIToggle<CR>", silent)

-- Move between windows
nnoremap("<leader>h", ":wincmd h<CR>", silent)
nnoremap("<leader>j", ":wincmd j<CR>", silent)
nnoremap("<leader>k", ":wincmd k<CR>", silent)
nnoremap("<leader>l", ":wincmd l<CR>", silent)

-- Navigate between buffers
nnoremap("gw", ":bprevious<CR>", silent)
nnoremap("gn", ":bnext<CR>", silent)

-- Stop search highligting
nnoremap(",<leader>", ":nohlsearch<CR>", silent)

-- Toggle search case sensitivity
nnoremap("<leader>cs", ":set ic!<CR>", silent)

-- Fuzzy project search
nnoremap("<leader>f", ":Rg<CR>", silent)

-- Execute curl responses and get the response data
nnoremap("<S-e>", "<cmd>lua callCurl()<CR>", silent)

-- Get curl history
nnoremap("<leader>ch", ":e $CURL_HISTORY_DIR<CR>")

-- Execute evans gRPC responses
nnoremap("<S-x>", "<cmd>lua callEvans()<CR>", silent)
