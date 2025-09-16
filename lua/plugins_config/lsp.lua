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

-- takes the name of the server as a string and other settings and cmd if needed as objects
local function create_handler(server, settings, cmd)
  lspconfig[server].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = settings,
    cmd = cmd,
  })
end

create_handler("lua_ls",{
  Lua = {
    diagnostics = {
      globals = { "vim" },
    },
  },
})

create_handler("pyright", {
  python = {
    analysis = {
      autoSearchPaths = true,
      diagnosticMode = "openFilesOnly",
      useLibraryCodeForTypes = true
    }
  }
})

create_handler("yamlls")
