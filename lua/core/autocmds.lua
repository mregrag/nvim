vim.api.nvim_create_autocmd("InsertCharPre", {
  callback = function()
    if vim.bo.buftype == "prompt" or vim.bo.filetype == "TelescopePrompt" then
      return
    end

    local char = vim.v.char
    local key = nil

    if char == "/" or char == "." then
      key = vim.api.nvim_replace_termcodes("<C-x><C-f>", true, false, true)
    elseif char:match("[%w_]") and vim.fn.pumvisible() == 0 then
      if vim.bo.omnifunc ~= "" then
        key = vim.api.nvim_replace_termcodes("<C-x><C-o>", true, false, true)
      end
    end

    if key then
      vim.api.nvim_feedkeys(key, "n", false)
    end
  end,
})


vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
    end,
})
