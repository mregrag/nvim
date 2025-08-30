--  Autocompletion & snippets
vim.pack.add({
    { src = "https://github.com/hrsh7th/nvim-cmp.git" },             -- Completion engine
    { src = "https://github.com/hrsh7th/cmp-buffer.git" },           -- Words in current buffer
    { src = "https://github.com/hrsh7th/cmp-path.git" },             -- File paths
    { src = "https://github.com/L3MON4D3/LuaSnip.git" },             -- Snippet engine
    { src = "https://github.com/saadparwaiz1/cmp_luasnip.git" },     -- LuaSnip completion source
    { src = "https://github.com/rafamadriz/friendly-snippets.git" }, -- Snippet collection
    { src = "https://github.com/onsails/lspkind.nvim.git" },         -- VSCode-like pictograms
    { src = "https://github.com/hrsh7th/cmp-nvim-lsp.git" },         -- LSP completion source
    { src = "https://github.com/neovim/nvim-lspconfig.git" },                              -- LSP client configs
    { src = "https://github.com/williamboman/mason.nvim" },                                -- LSP/DAP/Linter/Formatter installer
    { src = "https://github.com/williamboman/mason-lspconfig.nvim" },                      -- Mason bridge for lspconfig
    { src = "https://github.com/nvim-treesitter/nvim-treesitter.git", run = ":TSUpdate" }, -- Syntax highlighting
    { src = "https://github.com/nvim-lua/plenary.nvim.git" },
    { src = "https://github.com/nvim-telescope/telescope.nvim.git" },
    { src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim.git", build = "make" },
    { src = "https://github.com/nvim-lualine/lualine.nvim.git" },
    { src = "https://github.com/catppuccin/nvim" },
    { src = "https://github.com/akinsho/toggleterm.nvim",                      version = "main" },
})
