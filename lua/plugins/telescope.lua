-- Telescope configuration
local utils = require('utils')

local telescope = utils.safe_require('telescope')
if telescope then
  telescope.setup({
    defaults = {
      prompt_prefix = " ",
      selection_caret = " ",
      path_display = { "truncate" },
    },
  })

  local builtin = require('telescope.builtin')

  -- Keymaps
  vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
  vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live grep' })
  vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find buffers' })
  vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Help tags' })
  vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = 'Recent files' })
  vim.keymap.set('n', '<leader>fc', builtin.commands, { desc = 'Commands' })
  vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Keymaps' })
end
