require('mason').setup({
  -- Optional: Configure Mason's general settings here
})

local servers = {
    "pyright",
    "lua_ls",
    "yamlls",
    "ts_ls",
    "html",
    "cssls",
    "jsonls",
    "clangd",
    "bashls",
    "gopls",
    "eslint",
}

local servers_with_basic_setup = {
  "html",
  "gopls",
  "cssls",
  "bashls",
  "eslint",
}

local lsp = vim.lsp

require('mason-lspconfig').setup({
  -- List of LSP servers to automatically install if not present
  ensure_installed = servers,
  -- don't auto start servers as they get started below which creates duplicates
  automatic_enable = {
    exclude = servers
  }
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

local function create_handler(server, settings, cmd)
  lsp.config(server,{
    on_attach = on_attach,
    capabilities = capabilities,
    settings = settings,
    cmd = cmd,
  })
  lsp.enable(server)
end

create_handler("lua_ls", {
  Lua = {
    diagnostics = {
      globals = { "vim" },
    },
  },
})

create_handler("clangd", {},{ "clangd", "--background-index" })

create_handler("ts_ls", {
  codeActionOnSave = {
    enable = true,
    source = {
      organizeImports = true,
    },
  },
  TypeScript = {
    tsconfig = "tsconfig.json",
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

for _, entry in ipairs(servers_with_basic_setup) do
  create_handler(entry)
end

vim.keymap.set('n', '<leader>k', function()
  vim.diagnostic.config({ virtual_lines = { current_line = true }, virtual_text = false })

  vim.api.nvim_create_autocmd('CursorMoved', {
    group = vim.api.nvim_create_augroup('line-diagnostics', { clear = true }),
    callback = function()
      vim.diagnostic.config({ virtual_lines = false, virtual_text = true })
      return true
    end,
  })
end)
