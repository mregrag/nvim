vim.pack.add({
    { src = "https://github.com/vague-theme/vague.nvim", name = "vague" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", name = "treesitter" },
    { src = "https://github.com/nvim-telescope/telescope.nvim", name = "telescope" },
    { src = "https://github.com/neovim/nvim-lspconfig", name = "lspconfig" },
    { src = "https://github.com/nvim-lua/plenary.nvim", name = "plenary" },
    { src = "https://github.com/williamboman/mason.nvim", name = "mason" },
    { src = "https://github.com/williamboman/mason-lspconfig.nvim", name = "mason-lspconfig" }, -- THE BRIDGEI
}, { load = true })


pcall(require, "configs.lsp")
pcall(require, "configs.mason")

pcall(require, "configs.treesitter")
pcall(require, "configs.telescope")
pcall(require, "configs.color")
