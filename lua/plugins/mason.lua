-- Mason setup
require("mason").setup({
    ui = {
        border = "rounded",
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup({
    ensure_installed = {
        "ts_ls",     -- TypeScript / JavaScript
        "html",         -- HTML
        "tailwindcss",  -- TailwindCSS
        "eslint",       -- ESLint
    },
    automatic_installation = true,
})

