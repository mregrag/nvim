-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
    end,
})

-- Auto format on save (for all files)
vim.api.nvim_create_autocmd("BufWritePre", {
    group = vim.api.nvim_create_augroup("format_on_save", { clear = true }),
    pattern = "*",
    callback = function()
        vim.lsp.buf.format({ async = false })
    end,
})

-- Auto format on save (only for web-related files)
vim.api.nvim_create_autocmd("BufWritePre", {
    group = vim.api.nvim_create_augroup("web_format_on_save", { clear = true }),
    pattern = { "*.js", "*.ts", "*.tsx", "*.jsx", "*.json", "*.css", "*.scss", "*.html" },
    callback = function()
        vim.lsp.buf.format({ async = false })
    end,
})
