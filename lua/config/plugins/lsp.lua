vim.pack.add({
    { src = "https://github.com/mason-org/mason.nvim.git" },
    { src = "https://github.com/williamboman/mason-lspconfig.nvim.git" },
    { src = "https://github.com/neovim/nvim-lspconfig.git" },
    { src = "https://github.com/hrsh7th/cmp-nvim-lsp.git" },
})

vim.cmd("packadd mason.nvim")
vim.cmd("packadd mason-lspconfig.nvim")
vim.cmd("packadd nvim-lspconfig")
vim.cmd("packadd cmp-nvim-lsp")

local mason = require("mason")
local mlsp = require("mason-lspconfig") -- Make sure to require this
local lspcfg = require("lspconfig")

local capabilities = require("cmp_nvim_lsp").default_capabilities()

mason.setup()

mlsp.setup()

local on_attach = function(_, bufnr)
    local opts = { buffer = bufnr, silent = true }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>f", function()
        vim.lsp.buf.format({ async = true })
    end, opts)
end

local servers = {
    "ts_ls",
    "html",
    "cssls",
    "tailwindcss",
    "emmet_ls",
    "pyright",
    "lua_ls",
}

for _, server_name in ipairs(servers) do
    local server_config = {
        on_attach = on_attach,
        capabilities = capabilities,
    }
    lspcfg[server_name].setup(server_config)
end
