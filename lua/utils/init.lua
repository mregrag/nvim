-- Utility functions
local M = {}

-- Check if a plugin is installed
function M.is_plugin_installed(plugin_name)
  local install_path = vim.fn.stdpath('data') .. '/site/pack/plugins/start/' .. plugin_name
  return vim.fn.isdirectory(install_path) == 1
end

-- Safe require function
function M.safe_require(module)
  local ok, result = pcall(require, module)
  if not ok then
    vim.notify("Error loading module: " .. module .. "\n" .. result, vim.log.levels.ERROR)
    return nil
  end
  return result
end

-- Check if executable exists
function M.executable_exists(name)
  return vim.fn.executable(name) == 1
end

-- Get OS name
function M.get_os()
  if vim.fn.has("mac") == 1 then
    return "macos"
  elseif vim.fn.has("unix") == 1 then
    return "linux"
  elseif vim.fn.has("win32") == 1 then
    return "windows"
  else
    return "unknown"
  end
end

return M
