-- Application before-load settings

vim.g.rnu = true
vim.opt.mouse = ""
vim.opt.nu = true
vim.opt.cul = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"

vim.opt.errorbells = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.smartindent = true

vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- Give more space for displaying messages.
vim.opt.cmdheight = 1

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 50

-- Don't pass messages to |ins-completion-menu|.
vim.opt.shortmess:append("c")

-- Autopairs
vim.g.lexima_enable_newline_rules = 1

-- Leader key
vim.g.mapleader = " "

-- NERDTree
vim.g.NERDTreeShowHidden = true
vim.g.NERDTreeMinimalUI = 1
vim.g.NERDTreeMinimalMenu = 1

-- Vim-Go setup
vim.g.go_fmt_command = 'gopls'
vim.g.go_imports_autosave = 1
vim.g.go_fmt_autosave = 1
vim.g.go_mod_fmt_autosave = 1
vim.g.go_doc_keywordprg_enabled = 0
vim.g.go_metalinter_command='golangci-lint run'

-- Undotree setup
vim.g.undotree_SplitWidth=25

-- SQL client setup
vim.g.db_ui_use_nerd_fonts = 1
vim.g.db_ui_show_database_icon = 1
vim.g.db_ui_show_help = 0
vim.g.db_ui_win_position = "right"

-- Gitblame
vim.g.gitblame_enabled = 0
vim.g.gitblame_date_format = '%c (%r)'
vim.g.gitblame_message_template = '<author> • <summary> • <date> '
vim.g.gitblame_ignored_filetypes = {'gitcommit'}

-- Airline setup
vim.g.airline_powerline_fonts = 1
vim.g.material_terminal_italics = 1

-- For darcula theme only
vim.g.airline_theme='everforest'

-- Darcula specific highlights
vim.cmd("autocmd FileType * highlight Pmenu guibg=#292929")

vim.cmd("syntax on")
vim.cmd("set diffopt=vertical")
vim.cmd("set wildcharm=<C-z>")
