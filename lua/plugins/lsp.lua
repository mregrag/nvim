local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

mason.setup()
mason_lspconfig.setup()

vim.diagnostic.config({
    virtual_text = { spacing = 4, prefix = "●" },
    signs = true,
    float = { border = "rounded" },
})

local on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)
end


for _, server_name in ipairs(mason_lspconfig.get_installed_servers()) do
    local server = vim.lsp.config[server_name]
    if server and server.setup then
        server.setup({
            on_attach = on_attach,
        })
        vim.lsp.enable(server_name)
    end
end
