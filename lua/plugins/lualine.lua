local utils = require('utils')
local lualine = utils.safe_require('lualine')
if not lualine then return end

lualine.setup({
    options = {
        theme = 'vague',         -- match your colorscheme
        section_separators = '', -- minimal, rigorous
        component_separators = '|',
        icons_enabled = true,
        globalstatus = true,
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff' },
        lualine_c = { 'filename' },
        lualine_x = { 'diagnostics', 'encoding', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
    },
    inactive_sections = {
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
    },
})
