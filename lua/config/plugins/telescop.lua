vim.pack.add({
    { src = "https://github.com/nvim-lua/plenary.nvim.git" },
    { src = "https://github.com/nvim-telescope/telescope.nvim.git" },
    { src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim.git", build = "make" },
})

local telescope = require("telescope")
local actions   = require("telescope.actions")

telescope.setup({
    defaults = {
        prompt_prefix        = "🔭 ",
        selection_caret      = " ",
        path_display         = { "smart" },
        file_ignore_patterns = { "node_modules", ".git/" },
        mappings             = {
            i = {
                ["<C-n>"] = actions.cycle_history_next,
                ["<C-p>"] = actions.cycle_history_prev,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<esc>"] = actions.close,
            },
        },
    },
    pickers = {
        find_files = {
            theme     = "dropdown",
            previewer = false,
        },
        buffers = {
            sort_lastused = true,
            theme         = "dropdown",
            previewer     = false,
            mappings      = {
                i = { ["<C-d>"] = actions.delete_buffer },
                n = { ["d"] = actions.delete_buffer },
            },
        },
        help_tags = {
            theme     = "dropdown",
            previewer = false,
        },
    },
    extensions = {
        fzf = {
            fuzzy                   = true,
            override_generic_sorter = true,
            override_file_sorter    = true,
            case_mode               = "smart_case",
        },
    },
})

pcall(telescope.load_extension, "fzf")

vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, { desc = "Telescope: Find Files" })
vim.keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep, { desc = "Telescope: Live Grep" })
vim.keymap.set("n", "<leader>fb", require("telescope.builtin").buffers, { desc = "Telescope: Buffers" })
vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags, { desc = "Telescope: Help Tags" })
vim.keymap.set("n", "<leader>fo", require("telescope.builtin").oldfiles, { desc = "Telescope: Recent Files" })
