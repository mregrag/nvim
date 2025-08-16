vim.pack.add({
    { src = "https://github.com/hrsh7th/nvim-cmp.git" },
    { src = "https://github.com/hrsh7th/cmp-buffer.git" }, -- Words in current buffer
    { src = "https://github.com/hrsh7th/cmp-path.git" },   -- File paths
    { src = "https://github.com/L3MON4D3/LuaSnip.git" },
    { src = "https://github.com/saadparwaiz1/cmp_luasnip.git" },
    { src = "https://github.com/rafamadriz/friendly-snippets.git" }, -- A collection of snippets
    { src = "https://github.com/onsails/lspkind.nvim.git" },
})

vim.cmd("packadd nvim-cmp")
vim.cmd("packadd cmp-buffer")
vim.cmd("packadd cmp-path")
vim.cmd("packadd LuaSnip")
vim.cmd("packadd friendly-snippets")
vim.cmd("packadd lspkind.nvim")

local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },

    sources = cmp.config.sources({
        { name = "buffer" },   -- Word suggestions from the current file
        { name = "path" },     -- File path suggestions
        { name = "nvim_lsp" }, -- Language Server suggestions
        { name = "luasnip" },  -- Snippet suggestions
    }),

    mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item(),        -- Navigate up
        ["<C-n>"] = cmp.mapping.select_next_item(),        -- Navigate down
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept selection
        ["<C-Space>"] = cmp.mapping.complete(),            -- Manually trigger completion
    }),

    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    formatting = {
        format = lspkind.cmp_format({
            mode = "symbol_text", -- Show icons and text
            maxwidth = 50,
        }),
    },
})
