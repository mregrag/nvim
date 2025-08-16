-- Autocommands
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Highlight on yank
augroup("highlight_yank", { clear = true })
autocmd("TextYankPost", {
    group = "highlight_yank",
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
    end,
})

-- Auto format on save
augroup("format_on_save", { clear = true })
autocmd("BufWritePre", {
    group = "format_on_save",
    pattern = "*",
    callback = function()
        if vim.lsp.buf.format then
            vim.lsp.buf.format({ async = false })
        end
    end,
})

-- Resize splits if window got resized
augroup("resize_splits", { clear = true })
autocmd("VimResized", {
    group = "resize_splits",
    callback = function()
        vim.cmd("tabdo wincmd =")
    end,
})
