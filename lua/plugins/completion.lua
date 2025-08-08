-- Minimal, native-style completion configuration for rigorous mathematical writing
local utils = require('utils')

local cmp = utils.safe_require('cmp')
local luasnip = utils.safe_require('luasnip')

if not cmp or not luasnip then return end

require("luasnip.loaders.from_vscode").lazy_load()


cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },


    mapping = {
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
    },

    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer',  keyword_length = 3 },
        { name = 'path' },
    },

    formatting = {
        format = function(_, vim_item)
            return vim_item
        end,
    },
})
