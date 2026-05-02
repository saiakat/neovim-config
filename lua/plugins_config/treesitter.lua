-- require('nvim-treesitter.configs').setup{
--     ensure_installed = { "c", "lua", "python", "javascript", "typescript", "html", "css", "json", "bash", "dockerfile", "go", "java", "toml", "vim", "yaml" },
--
--     sync_install = false,
--     auto_install = true,
--     highlight = {
--         enable = true,
--     },
-- }
require('nvim-treesitter').install { "c", "lua", "python", "javascript", "typescript", "html", "css", "json", "bash", "dockerfile", "go", "java", "toml", "vim", "yaml" }
vim.api.nvim_create_autocmd('FileType', {
  pattern = { "c", "lua", "python", "javascript", "typescript", "html", "css", "json", "bash", "dockerfile", "go", "java", "toml", "vim", "yaml" },
  callback = function()
    -- syntax highlighting, provided by Neovim
    vim.treesitter.start()
    -- folds, provided by Neovim
    -- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    -- vim.wo.foldmethod = 'expr'
    -- indentation, provided by nvim-treesitter
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
