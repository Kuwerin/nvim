local Remap = require("kuwerin.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap

inoremap("jk", "<Esc>")
inoremap("jK", "<Esc>")
inoremap("JK", "<Esc>")
inoremap("Jk", "<Esc>")

nnoremap("<leader>p", ":NERDTreeToggle<CR>")
