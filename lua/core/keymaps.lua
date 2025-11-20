vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("v", "p", '"_dP')

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("t", "jk", [[<C-\><C-n>]])

vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>x", ":x<CR>")
vim.keymap.set("n", "<leader>e", ":Ex<CR>")


vim.keymap.set('n', '<C-k>', ':resize +2<CR>')
vim.keymap.set('n', '<C-j>', ':resize -2<CR>')
vim.keymap.set('n', '<C-l>', ':vertical resize -2<CR>')
vim.keymap.set('n', '<C-h>', ':vertical resize +2<CR>')



vim.keymap.set("n", "<leader>nv", function()
    vim.cmd("edit " .. vim.fn.stdpath("config"))
end, { desc = "Open Neovim config directory" })

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

