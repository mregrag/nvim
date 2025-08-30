local ok, configs = pcall(require, "nvim-treesitter.configs")
if not ok then
    return
end

configs.setup({
    ensure_installed = {
        "lua",
        "javascript",
        "typescript",
        "html",
    },
    sync_install = false,
    auto_install = true,

    highlight = {
        enable = true,              -- Enable syntax highlighting
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true,              -- Enable Treesitter-based indentation
    },
    incremental_selection = {
        enable = true,
    },
})

