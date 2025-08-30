vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.winborder = "double"

-- Editing
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.linebreak = true

-- Search
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Files
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.cache/nvim/undo")

-- Performance
vim.opt.updatetime = 250
vim.opt.timeoutlen = 500
vim.opt.lazyredraw = false

-- Splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Other
vim.opt.mouse = "a"
vim.opt.completeopt = "menu,menuone,noselect"
