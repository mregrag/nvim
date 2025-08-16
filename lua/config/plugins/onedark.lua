vim.pack.add({
    { src = "https://github.com/navarasu/onedark.nvim" },
})

require("onedark").setup({
    style = 'deep',
    transparent = true,
})

vim.cmd("colorscheme onedark")
