local opt = vim.opt

-- Line numbers
vim.opt.relativenumber = true
vim.opt.number = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.wrap = false
vim.opt.linebreak = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- UI
vim.opt.termguicolors = true
vim.opt.cursorline = false
vim.opt.signcolumn = "yes"
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Files
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.cache/nvim/undo")

vim.opt.wildmode = "longest:full,full"
vim.opt.complete:append('o')
vim.opt.completeopt = { "menuone", "noinsert", "noselect" }

vim.o.pumheight = 5
vim.o.pumborder ='rounded'
