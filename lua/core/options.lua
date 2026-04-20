local opt = vim.opt

-- Line numbers
opt.relativenumber = true
opt.number = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true

-- UI
opt.termguicolors = true
opt.cursorline = true -- Highlights the current line
opt.signcolumn = "yes"
opt.splitright = true
opt.splitbelow = true

vim.opt.wildmode = "longest:full,full"
vim.opt.completeopt = { "menu", "menuone", "noselect", "noinsert" }

