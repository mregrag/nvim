vim.pack.add({
    -- LSP server defaults + Mason installer/bridge
    { src = "https://github.com/williamboman/mason.nvim" },
    { src = "https://github.com/williamboman/mason-lspconfig.nvim" },

    -- Completion core + LSP source + snippets
    { src = "https://github.com/hrsh7th/nvim-cmp.git" },
    { src = "https://github.com/hrsh7th/cmp-nvim-lsp.git" },
    { src = "https://github.com/L3MON4D3/LuaSnip.git" },
    { src = "https://github.com/saadparwaiz1/cmp_luasnip.git" },
    { src = "https://github.com/rafamadriz/friendly-snippets.git" },

    -- Telescope + fzf-native
    { src = "https://github.com/nvim-lua/plenary.nvim.git" },
    { src = "https://github.com/nvim-telescope/telescope.nvim.git" },
    { src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim.git", build = "make" },

    -- Treesitter (syntax, indentation, selection)
    { src = "https://github.com/nvim-treesitter/nvim-treesitter.git", run = ":TSUpdate" },
    { src = "https://github.com/navarasu/onedark.nvim" },
    { src = "https://github.com/stevearc/oil.nvim" },

})

