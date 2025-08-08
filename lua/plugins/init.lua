local utils = require('utils')

-- Function to install plugin if not present
local function ensure_plugin(url, name)
    local install_path = vim.fn.stdpath('data') .. '/site/pack/plugins/start/' .. name
    if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
        print('Installing ' .. name .. '...')
        vim.fn.system({ 'git', 'clone', '--depth=1', url, install_path })
        vim.cmd('packloadall!')
        return true
    end
    return false
end

-- Essential plugins (add mason & mason-lspconfig)
local plugins = {
    { 'https://github.com/nvim-lualine/lualine.nvim',         'lualine.nvim' },
    { 'https://github.com/navarasu/onedark.nvim',             'onedark.nvim' },
    { 'https://github.com/nvim-lua/plenary.nvim',             'plenary.nvim' },
    { 'https://github.com/nvim-telescope/telescope.nvim',     'telescope.nvim' },
    { 'https://github.com/nvim-treesitter/nvim-treesitter',   'nvim-treesitter' },
    { 'https://github.com/neovim/nvim-lspconfig',             'nvim-lspconfig' },
    { 'https://github.com/williamboman/mason.nvim',           'mason.nvim' },           -- ← ajout rigoureux
    { 'https://github.com/williamboman/mason-lspconfig.nvim', 'mason-lspconfig.nvim' }, -- ← ajout rigoureux
    { 'https://github.com/hrsh7th/nvim-cmp',                  'nvim-cmp' },
    { 'https://github.com/L3MON4D3/LuaSnip',                  'LuaSnip' },
}

-- Install plugins
local any_installed = false
for _, plugin in ipairs(plugins) do
    if ensure_plugin(plugin[1], plugin[2]) then
        any_installed = true
    end
end

-- If any plugins were just installed, restart to ensure they're loaded
if any_installed then
    print('Plugins installed! Please restart Neovim.')
    return
end
