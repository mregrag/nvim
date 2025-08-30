local ok, telescope = pcall(require, "telescope")
if not ok then
    return
end

telescope.setup({
    defaults = {
        prompt_prefix = "   ",
        selection_caret = " ",
        path_display = { "smart" },
        sorting_strategy = "ascending",
        layout_config = {
            prompt_position = "top",
            width = 0.6,
            height = 0.5,
        },
        mappings = {
            i = {
                ["<C-j>"] = "move_selection_next",
                ["<C-k>"] = "move_selection_previous",
                ["<C-q>"] = "send_to_qflist",
            },
        },
    },
    pickers = {find_files = {hidden = true}},
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        },
    },
})

pcall(telescope.load_extension, "fzf")

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)   -- Find files
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)    -- Search text
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)      -- Open buffers
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)    -- Help tags
map("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>", opts)     -- Recent files
map("n", "<leader>fc", "<cmd>Telescope commands<cr>", opts)     -- Commands
map("n", "<leader>fm", "<cmd>Telescope marks<cr>", opts)        -- Marks
map("n", "<leader>fr", "<cmd>Telescope registers<cr>", opts)    -- Registers
map("n", "<leader>fq", "<cmd>Telescope quickfix<cr>", opts) -- Show quickfix list
