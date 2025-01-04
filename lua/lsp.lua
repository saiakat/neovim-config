require("mason").setup()
require("mason-lspconfig").setup({})

local on_attach = function (_ , _)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
    
end

require("lspconfig").lua_ls.setup({
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
        },
    },
})

require("lspconfig").clangd.setup({
    on_attach = on_attach,
    cmd = { "clangd", "--background-index" },
})

require("lspconfig").ts_ls.setup({
    on_attach = on_attach,
    settings = {
        codeActionOnSave = {
            enable = true,
            source = {
                organizeImports = true,
            },
        },
        TypeScript = {
            tsconfig = "tsconfig.json",
        },
    },
})