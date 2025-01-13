local builtin = require('telescope.builtin')
local telescope = require('telescope')

vim.keymap.set('n', '<c-p>', builtin.find_files, { noremap = true, silent = true })
vim.keymap.set('n', '<Space><Space>', builtin.oldfiles, { noremap = true, silent = true })
vim.keymap.set('n', '<Space>fg', builtin.live_grep, { noremap = true, silent = true })
vim.keymap.set('n', '<Space>fh', builtin.help_tags, { noremap = true, silent = true })

telescope.setup {
    pickers = {
    find_files = {
        hidden = true
        }
    }
} 