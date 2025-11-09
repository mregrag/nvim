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
