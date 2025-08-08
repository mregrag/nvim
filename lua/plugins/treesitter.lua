-- Treesitter configuration
local utils = require('utils')

local treesitter = utils.safe_require('nvim-treesitter.configs')
if treesitter then
  treesitter.setup({
    ensure_installed = {
      "lua",
      "vim",
      "vimdoc",
      "json",
      "yaml",
      "bash",
    },
    sync_install = false,
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = true,
    },
    incremental_selection = {
      enable = true,
    },
  })
end
