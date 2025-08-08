-- Rigorous config: open, close, and split Neovim built-in terminals with unique buffers

local terminals = {}

local function open_split_terminal(mode, size)
  local term = terminals[mode]
  if term and vim.api.nvim_buf_is_valid(term.bufnr) then
    -- Focus existing terminal window if valid
    if term.winid and vim.api.nvim_win_is_valid(term.winid) then
      vim.api.nvim_set_current_win(term.winid)
      return
    end
    -- Reopen terminal buffer in new split
    vim.cmd((size or '') .. mode .. 'split')
    local winid = vim.api.nvim_get_current_win()
    vim.api.nvim_win_set_buf(winid, term.bufnr)
    term.winid = winid
    return
  end
  -- Create new terminal
  vim.cmd((size or '') .. mode .. 'split | terminal')
  local winid = vim.api.nvim_get_current_win()
  local bufnr = vim.api.nvim_get_current_buf()
  terminals[mode] = { winid = winid, bufnr = bufnr }
end

local function close_split_terminal(mode)
  local term = terminals[mode]
  if term and term.winid and vim.api.nvim_win_is_valid(term.winid) then
    vim.api.nvim_win_close(term.winid, false)
  end
end

-- Keymaps: open/close horizontal terminal (15 lines)
vim.keymap.set('n', '<leader>t', function() open_split_terminal('', '15') end,
  { desc = 'Open horizontal terminal (15 lines)' })
vim.keymap.set('n', '<leader>c', function() close_split_terminal('') end, { desc = 'Close horizontal terminal' })

-- Keymaps: open/close vertical terminal (60 columns)
vim.keymap.set('n', '<leader>tv', function() open_split_terminal('v', '60') end,
  { desc = 'Open vertical terminal (60 columns)' })
vim.keymap.set('n', '<leader>tcv', function() close_split_terminal('v') end, { desc = 'Close vertical terminal' })


-- Exit terminal mode with <Esc>
vim.api.nvim_create_autocmd('TermOpen', {
  pattern = '*',
  callback = function()
    vim.keymap.set('t', 'jk', [[<C-\><C-n>]], { buffer = true, desc = 'Exit terminal mode' })
  end
})
