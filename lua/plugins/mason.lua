local utils = require('utils')
local mason = utils.safe_require("mason")
local mason_lspconfig = require("mason-lspconfig")

mason.setup()

mason_lspconfig.setup({
    ensure_installed = {
        "ts_ls",  -- JavaScript & TypeScript
        "clangd", -- C & C++
        "lua_ls",
        "html",
        "cssls",
    },
    automatic_installation = true,
})
