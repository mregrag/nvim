local ok, telescope = pcall(require, "telescope")
if not ok then
    return
end

telescope.setup({
    defaults = {
        prompt_prefix = "   ",
        selection_caret = " ",
        sorting_strategy = "ascending",
        layout_config = { prompt_position = "top", width = 0.6, height = 0.5, },
        mappings = { i = { ["<C-j>"] = "move_selection_next", ["<C-k>"] = "move_selection_previous", ["<C-q>"] = "send_to_qflist", }, },
    },
    pickers = {find_files = {hidden = true}},
})


local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)   -- Find files
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)    -- Search text
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)      -- Open buffers
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)    -- Help tags
vim.keymap.set("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>", opts)     -- Recent files
vim.keymap.set("n", "<leader>fc", "<cmd>Telescope commands<cr>", opts)     -- Commands
vim.keymap.set("n", "<leader>fm", "<cmd>Telescope marks<cr>", opts)        -- Marks
vim.keymap.set("n", "<leader>fr", "<cmd>Telescope registers<cr>", opts)    -- Registers
vim.keymap.set("n", "<leader>fq", "<cmd>Telescope quickfix<cr>", opts) -- Show quickfix list
