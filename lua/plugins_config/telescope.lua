local builtin = require('telescope.builtin')
local telescope = require('telescope')

-- telescope keymaps
vim.keymap.set('n', '<c-p>', builtin.find_files, { noremap = true, silent = true })
vim.keymap.set('n', '<Space><Space>', builtin.oldfiles, { noremap = true, silent = true })
vim.keymap.set('n', '<Space>fg', builtin.live_grep, { noremap = true, silent = true })
vim.keymap.set('n', '<Space>fh', builtin.help_tags, { noremap = true, silent = true })

telescope.setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    }
  },
  pickers = {
    find_files = {
      hidden = true
      }
  },
}

local harpoon = require("harpoon")
-- REQUIRED
harpoon:setup()
-- REQUIRED

-- harpoon keymaps
vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>e", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)
vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end)
vim.keymap.set("n", "<leader>6", function() harpoon:list():select(6) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<leader>s", function() harpoon:list():prev() end)
vim.keymap.set("n", "<leader>d", function() harpoon:list():next() end)

local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end

vim.keymap.set("n", "<space>e", function() toggle_telescope(harpoon:list()) end,
    { desc = "Open harpoon window" })
telescope.load_extension('fzf')
