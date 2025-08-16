vim.pack.add({
    {
        src     = "https://github.com/nvim-treesitter/nvim-treesitter.git",
        version = "main",
        build   = ":TSUpdateSync"
    },
})

vim.cmd("packadd nvim-treesitter")

local ts_configs = require("nvim-treesitter.configs")

ts_configs.setup({
    ensure_installed = {
        "lua", -- for your init.lua and Lua plugins
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "yaml",
    },

    highlight = {
        enable = true,
    },

    indent = {
        enable = true,
    },
})
