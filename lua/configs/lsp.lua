vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = false,
    underline = true,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
local completion_group = vim.api.nvim_create_augroup("native-lsp-completion", { clear = false })

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("native-lsp", { clear = true }),
    callback = function(ev)
        local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
        local opts = { buffer = ev.buf }

        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

        if client:supports_method("textDocument/completion") then
            if vim.lsp.completion and vim.lsp.completion.enable then
                vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
            end

            vim.api.nvim_clear_autocmds({ group = completion_group, buffer = ev.buf })
            vim.api.nvim_create_autocmd("InsertCharPre", {
                group = completion_group,
                buffer = ev.buf,
                callback = function()
                    if vim.fn.pumvisible() == 1 then
                        return
                    end
                    vim.lsp.completion.get()
                end,
            })
        end
    end,
})

vim.lsp.config("pyright", {
    capabilities = capabilities,
    cmd = { "pyright-langserver", "--stdio" },
    filetypes = { "python" },
    root_markers = { "pyproject.toml", "setup.py", ".git" },
    single_file_support = true,
})

vim.lsp.config("clangd", {
    capabilities = capabilities,
    cmd = { "clangd" },
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
    root_markers = { "compile_commands.json", "compile_flags.txt", ".git" },
    single_file_support = true,
})

vim.lsp.config("ts_ls", {
    capabilities = capabilities,
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
    single_file_support = true,
})

vim.lsp.enable({ "pyright", "clangd", "ts_ls" })
