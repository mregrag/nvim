-- plugins/lsp.lua
-- LSP configuration for JavaScript, TypeScript, HTML, CSS, and Node.js

local utils = require('utils')
local lspconfig = utils.safe_require('lspconfig')
if not lspconfig then return end

-- Add capabilities for better completion and snippets
local capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_nvim_lsp = utils.safe_require('cmp_nvim_lsp')
if cmp_nvim_lsp then
        capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Common on_attach function
local on_attach = function(client, bufnr)
        local opts = { buffer = bufnr, silent = true }
        local map = vim.keymap.set

        -- Navigation
        map('n', 'gD', vim.lsp.buf.declaration, opts)
        map('n', 'gd', vim.lsp.buf.definition, opts)
        map('n', 'gi', vim.lsp.buf.implementation, opts)
        map('n', 'gr', vim.lsp.buf.references, opts)
        map('n', '<leader>D', vim.lsp.buf.type_definition, opts)

        -- Documentation and help
        map('n', 'K', vim.lsp.buf.hover, opts)
        map('n', '<C-k>', vim.lsp.buf.signature_help, opts)

        -- Code actions and refactoring
        map('n', '<leader>rn', vim.lsp.buf.rename, opts)
        map({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
        map('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, opts)

        -- Workspace management
        map('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
        map('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
        map('n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)

        -- Diagnostics navigation
        map('n', '<leader>o', vim.diagnostic.open_float, opts)
        map('n', '[d', vim.diagnostic.goto_prev, opts)
        map('n', ']d', vim.diagnostic.goto_next, opts)
        map('n', '<leader>q', vim.diagnostic.setloclist, opts)
end

-- Configure servers
local servers = {
        -- lua
        lua_ls = {},
        -- JavaScript/TypeScript
        ts_ls = {},

        -- HTML
        html = {},

        -- CSS
        cssls = {},

        -- JSON support for package.json, etc.
        jsonls = {},

        -- ESLint
        eslint = {},

        tailwindcss = {},
}

-- Setup servers
for server, config in pairs(servers) do
        config.on_attach = on_attach
        config.capabilities = capabilities
        lspconfig[server].setup(config)
end

-- Simple diagnostics configuration
vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = { border = 'rounded' },
})

-- Set diagnostic signs
local signs = { Error = "E", Warn = "W", Hint = "H", Info = "I" }
for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
