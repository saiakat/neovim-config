require('mason').setup({
  -- Optional: Configure Mason's general settings here
})

require('mason-lspconfig').setup({
  -- List of LSP servers to automatically install if not present
  ensure_installed = {
    "pyright",
    "lua_ls",
    "yamlls",
      -- Add more LSP server names as needed
  },
  -- Handlers for configuring LSP servers with nvim-lspconfig
  handlers = {
      function(server_name)
          require('lspconfig')[server_name].setup({})
      end,
  },
})
