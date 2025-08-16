vim.pack.add({
    { src = "https://github.com/nvim-lualine/lualine.nvim.git" },
})

vim.cmd("packadd lualine.nvim")

local lualine = require("lualine")

lualine.setup({
    options = {
        theme                = "auto",
        component_separators = { left = "", right = "" },
        section_separators   = { left = "", right = "" },
        disabled_filetypes   = { "toggleterm", "NvimTree", "alpha" },
        globalstatus         = true,
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
    },
    extensions = { "quickfix", "fzf", "nvim-tree" },
})
