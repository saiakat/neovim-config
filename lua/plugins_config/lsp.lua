require('mason').setup({
  -- Optional: Configure Mason's general settings here
})

local servers = {
  "pyright",
  "lua_ls",
  "yamlls",
}
local lspconfig = require('lspconfig')

require('mason-lspconfig').setup({
  -- List of LSP servers to automatically install if not present
  ensure_installed = servers,
  -- exclude automatic server startup and attachment
  -- It caused duplicated server attachment.
  automatic_enable = {
    exclude = servers,
  },
})

local on_attach = function (_ , _)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local function create_handler(settings)
  local config = {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = settings
  }
  return config
end

lspconfig.lua_ls.setup(create_handler({
  Lua = {
    diagnostics = {
      globals = { "vim" },
    },
  },
}))

lspconfig.pyright.setup(create_handler({
  python = {
    analysis = {
      autoSearchPaths = true,
      diagnosticMode = "openFilesOnly",
      useLibraryCodeForTypes = true
    }
  }
}))

lspconfig["yamlls"].setup(create_handler())
