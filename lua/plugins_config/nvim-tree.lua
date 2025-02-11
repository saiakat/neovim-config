vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('nvim-tree').setup()

vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true }) 
vim.keymap.set('n', '<C-f>', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })