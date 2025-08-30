require("catppuccin").setup({
    flavour = "mocha",
    background = { 
        light = "latte",
        dark = "mocha",
    },
    transparent_background = true, 
    show_end_of_buffer = true,
    term_colors = true, 
    dim_inactive = {
        enabled = false, 
        shade = "dark",
        percentage = 0.5,
    },
})

vim.cmd.colorscheme "catppuccin"
