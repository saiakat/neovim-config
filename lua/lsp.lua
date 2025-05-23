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

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").lua_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
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
    capabilities = capabilities,
    cmd = { "clangd", "--background-index" },
})

require("lspconfig").ts_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
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

require("lspconfig").html.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

-- lsp for zig 
require("lspconfig").zls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

--lsp for go
require("lspconfig").gopls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

--lsp for css
require("lspconfig").cssls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})
