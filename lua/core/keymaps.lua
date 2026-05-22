vim.g.mapleader = " " -- Setting space as your Leader key

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- General keymaps
--
keymap.set("i", "<C-Space>", "<C-x><C-o>", opts)
keymap.set("i", "<Tab>", function()
    return vim.fn.pumvisible() == 1 and "<C-n>" or "<Tab>"
end, { expr = true, silent = true })
keymap.set("i", "<S-Tab>", function()
    return vim.fn.pumvisible() == 1 and "<C-p>" or "<S-Tab>"
end, { expr = true, silent = true })

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

keymap.set("n", "<leader>nh", ":nohl<CR>")
keymap.set("n", "<leader>w", ":w<CR>")
keymap.set("n", "<leader><leader>q", ":q<CR>")

keymap.set("i", "jk", "<Esc>")
keymap.set("n", "<leader>w", ":w<CR>")
keymap.set("n", "<leader>x", ":x<CR>")
keymap.set("n", "<leader><leader>e", ":Ex<CR>")

vim.keymap.set("v", "p", '"_dP', opts)
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])


keymap.set('n', '<C-k>', ':resize +2<CR>')
keymap.set('n', '<C-j>', ':resize -2<CR>')
keymap.set('n', '<C-l>', ':vertical resize -2<CR>')
keymap.set('n', '<C-h>', ':vertical resize +2<CR>')

keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
