local lspconfig = require("lspconfig")

vim.diagnostic.config({
    virtual_text = { spacing = 4, prefix = "●", },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = { border = "rounded", source = "always", },
})

local on_attach = function(_, bufnr)
    vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

    local map = function(mode, lhs, rhs)
        vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, buffer = bufnr })
    end
    map("n", "gd", vim.lsp.buf.definition)
    map("n", "K", vim.lsp.buf.hover)
    map("n", "gi", vim.lsp.buf.implementation)
    map("n", "<leader>rn", vim.lsp.buf.rename)
    map("n", "<leader>ca", vim.lsp.buf.code_action)
    map("n", "gr", vim.lsp.buf.references)
    map("n", "[d", vim.diagnostic.goto_prev)
    map("n", "]d", vim.diagnostic.goto_next)
    map("n", "<leader>e", vim.diagnostic.open_float)
    map("n", "<leader>q", vim.diagnostic.setloclist)
end


vim.lsp.enable({ "lua_ls", "ts_ls", "html", "tailwindcss", "eslint" })

