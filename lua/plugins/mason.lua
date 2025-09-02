require("mason").setup({ })

require("mason-lspconfig").setup({
    ensure_installed = { "ts_ls", "html",  "tailwindcss", "eslint", },
    automatic_installation = true,
})

