-----------------------------------------------------------
-- General Neovim settings and configuration
-----------------------------------------------------------

-- Default options are not included
-- See: https://neovim.io/doc/user/vim_diff.html
-- [2] Defaults - *nvim-defaults*

local g = vim.g     -- Global variables
local opt = vim.opt -- Set options (global/buffer/windows-scoped)

-----------------------------------------------------------
-- General
-----------------------------------------------------------
opt.mouse = 'a'                               -- Enable mouse support
opt.clipboard = 'unnamedplus'                 -- Copy/paste to system clipboard
opt.swapfile = false                          -- Don't use swapfile
opt.completeopt = 'menuone,noinsert,noselect' -- Autocomplete options

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.number = true             -- Show line number
opt.relativenumber = true -- add numbers to each line on the left side
opt.showmatch = true          -- Highlight matching parenthesis
opt.foldmethod = 'marker'     -- Enable folding (default 'foldmarker')
opt.colorcolumn = '140'        -- Line lenght marker at 80 columns
opt.splitright = true         -- Vertical split to the right
opt.splitbelow = true         -- Horizontal split to the bottom
opt.ignorecase = true         -- Ignore case letters when search
opt.smartcase = true          -- Ignore lowercase for the whole pattern
opt.linebreak = true          -- Wrap on word boundary
opt.termguicolors = true      -- Enable 24-bit RGB colors
opt.laststatus = 3            -- Set global statusline

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.expandtab = true   -- Use spaces instead of tabs
opt.shiftwidth = 2     -- Shift 2 spaces when tab
opt.tabstop = 2        -- 1 tab == 2 spaces
opt.smartindent = true -- Autoindent new lines

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true     -- Enable background buffers
opt.history = 500     -- Remember N lines in history
opt.lazyredraw = true -- Faster scrolling
opt.synmaxcol = 240   -- Max column for syntax highlight
opt.updatetime = 250  -- ms to wait for trigger an event
-----------------------------------------------------------
-- Searching 
-----------------------------------------------------------
opt.incsearch = true
opt.hlsearch = false

vim.diagnostic.config({ virtual_text = true })
