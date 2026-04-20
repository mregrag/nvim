vim.g.mapleader = " " -- Setting space as your Leader key

local keymap = vim.keymap

-- General keymaps
--
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })
keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit" })

keymap.set("i", "jk", "<Esc>")
keymap.set("n", "<leader>w", ":w<CR>")
keymap.set("n", "<leader>x", ":x<CR>")
keymap.set("n", "<leader>e", ":Ex<CR>")


vim.keymap.set("n", "<leader>Y", [["+Y]])


keymap.set('n', '<C-k>', ':resize +2<CR>')
keymap.set('n', '<C-j>', ':resize -2<CR>')
keymap.set('n', '<C-l>', ':vertical resize -2<CR>')
keymap.set('n', '<C-h>', ':vertical resize +2<CR>')

keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

