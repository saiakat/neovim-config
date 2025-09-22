require('mason').setup({
  -- Optional: Configure Mason's general settings here
})

local servers = require('plugins_config.lsp_servers').servers
local names = require('plugins_config.lsp_servers').names
local lsp = vim.lsp
local diagnostic = vim.diagnostic

require('mason-lspconfig').setup({
  -- List of LSP servers to automatically install if not present
  ensure_installed = names,
  -- don't auto start servers as they get started below which creates duplicates
  automatic_enable = {
    exclude = names,
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

local function create_handler(server, config)
  lsp.config(server,{
    on_attach = on_attach,
    capabilities = capabilities,
    settings = config.settings,
    cmd = config.cmd
  })
  lsp.enable(server)
end

for k,v in pairs(servers) do
  create_handler(k, v.config)
end

local function toggle_virt_text()
  if diagnostic.config().virtual_text == true then
    diagnostic.config({ virtual_text = false })
  else
    diagnostic.config({ virtual_text = true })
  end
end

vim.keymap.set('n', '<leader>vt', toggle_virt_text)
vim.keymap.set('n', '<leader>k', function()
  diagnostic.config({ virtual_lines = { current_line = true }, virtual_text = false })

  vim.api.nvim_create_autocmd('CursorMoved', {
    group = vim.api.nvim_create_augroup('line-diagnostics', { clear = true }),
    callback = function()
      diagnostic.config({ virtual_lines = false, virtual_text = true })
      return true
    end,
  })
end)
