require("toggleterm").setup({
    size = 15,
    open_mapping = [[<C-\>]], -- Toggle terminal with Ctrl+\
    hide_numbers = true,
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = "horizontal", -- "vertical" | "horizontal" | "tab" | "float"
    close_on_exit = true,
    shell = vim.o.shell, -- Use your default shell
    float_opts = {
        border = "curved",
        winblend = 3,
    },
})

local opts = { noremap = true, silent = true }
vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
    cmd = "lazygit",
    hidden = true,
    direction = "float",
    float_opts = { border = "curved" },
})

function _LAZYGIT_TOGGLE()
    lazygit:toggle()
end

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<leader>tt", "<cmd>ToggleTerm<cr>", opts)       -- Default terminal
map("n", "<leader>tg", "<cmd>lua _LAZYGIT_TOGGLE()<cr>", opts) -- Git UI
