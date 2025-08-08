-- Rigorous configuration for colorscheme
require('onedark').setup({
    style = 'deep',     -- 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer'
    transparent = true, -- Show/hide background
})
local ok = pcall(vim.cmd.colorscheme, 'onedark')
