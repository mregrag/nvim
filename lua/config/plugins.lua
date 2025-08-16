-- config/plugins.lua
-- Load every Lua file in lua/config/plugins/*.lua
local plugin_path = vim.fn.stdpath("config") .. "/lua/config/plugins"

for _, fname in ipairs(vim.fn.readdir(plugin_path)) do
  if fname:match("%.lua$") then
    -- drop the “.lua” and require the module
    local mod = "config.plugins." .. fname:sub(1, -5)
    require(mod)
  end
end
