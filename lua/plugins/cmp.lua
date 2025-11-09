require("cmp").setup({
    window = {
        completion = require("cmp").config.window.bordered({
            border = "rounded", 
            winhighlight = "Normal:CmpPmenu,FloatBorder:CmpBorder",
            scrollbar = false,
            side_padding = 1,
        }),
        documentation = require("cmp").config.window.bordered({
            border = "single",
            winhighlight = "Normal:CmpDoc",
        }),
    },

    mapping = require("cmp").mapping.preset.insert({
        ["<C-b>"] = require("cmp").mapping.scroll_docs(-4),
        ["<C-f>"] = require("cmp").mapping.scroll_docs(4),
        ["<CR>"] = require("cmp").mapping.confirm({ select = true }),
    }),
    sources = require("cmp").config.sources({
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
    }),
})
