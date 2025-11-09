vim.diagnostic.config({
    virtual_text = { spacing = 4, prefix = "●" },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = { border = "rounded", source = "always" },
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local buf = ev.buf
        local map = function(mode, lhs, rhs)
            vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, buffer = buf })
        end
        vim.bo[buf].omnifunc = "v:lua.vim.lsp.omnifunc"
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
    end,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
pcall(function()
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
end)

require("mason").setup()


vim.lsp.config("ts_ls", {
    capabilities = capabilities,
})
vim.lsp.enable("ts_ls")

vim.lsp.config("html", {
    capabilities = capabilities,
})
vim.lsp.enable("html")

vim.lsp.config("tailwindcss", {
    capabilities = capabilities,
})
vim.lsp.enable("tailwindcss")

vim.lsp.config("eslint", {
    capabilities = capabilities,
})
vim.lsp.enable("eslint")

vim.lsp.config("yamlls", {
    capabilities = capabilities,
})
vim.lsp.enable("yamlls")
