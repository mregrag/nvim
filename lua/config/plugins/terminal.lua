vim.pack.add({
    { src = "https://github.com/akinsho/toggleterm.nvim", version = "main" },
})

vim.cmd("packadd toggleterm.nvim")

-- 3) Safely require and configure toggleterm
local ok, toggleterm = pcall(require, "toggleterm")
if not ok or type(toggleterm.setup) ~= "function" then
    vim.notify("toggleterm.nvim not found", vim.log.levels.WARN)
    return
end

toggleterm.setup({
    -- size can be an integer or a function (term) -> integer
    size = 15,
    open_mapping = "<leader>t",
    hide_numbers = true,
    shade_terminals = false,
    start_in_insert = true,
    persist_size = true,
    direction = "horizontal",
    close_on_exit = true,
})

-- 5) Keymap: press <leader>t to toggle the default horizontal terminal
vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm<cr>", {
    noremap = true,
    silent = true,
    desc = "Toggle terminal",
})

vim.keymap.set('n', 'q', '<cmd>ToggleTerm<cr>', {
    buffer = 0,
    noremap = true,
    silent = true,
    desc = "Close ToggleTerm",
})
