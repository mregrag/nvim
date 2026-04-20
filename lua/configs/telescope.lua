local telescope = require("telescope")

telescope.setup({
    defaults = {
        selection_caret = "  ",
        path_display = { "truncate" },
    }
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find Files" })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Grep Search" })



