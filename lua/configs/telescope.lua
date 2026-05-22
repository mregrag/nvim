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
vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = "Recent Files" })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Buffers" })
vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = "Grep Word" })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Help" })
vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = "Keymaps" })
vim.keymap.set('n', '<leader>fc', builtin.commands, { desc = "Commands" })
vim.keymap.set('n', '<leader>fm', builtin.marks, { desc = "Marks" })
vim.keymap.set('n', '<leader>fR', builtin.registers, { desc = "Registers" })
vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = "Git Status" })
vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = "Git Commits" })
vim.keymap.set('n', '<leader>gb', builtin.git_branches, { desc = "Git Branches" })
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = "Diagnostics" })
vim.keymap.set('n', '<leader>f.', builtin.resume, { desc = "Resume" })


