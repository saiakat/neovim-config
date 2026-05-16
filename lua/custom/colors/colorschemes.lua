local palette = require("custom.colors.palette")
local M = {}

function M.catppuccin ()
 require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = true, -- disables setting the background color.
    show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
   term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
    dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
    },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    no_underline = false, -- Force no underline
    styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" }, -- Change the style of comments
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
        -- miscs = {}, -- Uncomment to turn off hard-coded styles
    },
    color_overrides = {},
    custom_highlights = {},
    default_integrations = true,
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = {
        enabled = true,
        indentscope_color = "",
        },
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
  })
end


function M.monokai (background_main, background_tree, transparent)
  transparent = transparent or false
  background_main = background_main or palette.backgrounds.crust
  background_tree = background_tree or palette.backgrounds.rose

  require("monokai-pro").setup({
    transparent_background = transparent,
    terminal_colors = true,
    devicons = true,
    styles = {
      comment = { italic = true },
      keyword = { italic = true },
      type = { italic = true },
      storageclass = { italic = true },
      structure = { italic = true },
      parameter = { italic = true },
      annotation = { italic = true },
      tag_attribute = { italic = true },
    },
    filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
    day_night = {
      enable = false,
      day_filter = "pro",
      night_filter = "spectrum",
    },
    inc_search = "background", -- underline | background
    background_clear = {
      "toggleterm",
      "telescope",
      "renamer",
      "notify",
      "nvim-tree",
      "neo-tree",
    },
    override = function(scheme)
      local p = { fg = "#f92672", italic = true }
      return {
        ["@keyword.function"] = { fg = "#e95678" },
        ["@variable.parameter"]                    = p,
        ["@lsp.type.parameter"]                    = p,
        ["@lsp.typemod.parameter.declaration"]     = p,
        ["@punctuation.bracket"] = { fg = "#9399b2" },
        ["@property"] = { fg = "#fff0d0" },
        ["@constructor"] = { fg = "#9399b2" },
        ["DevIconJs"] = { fg = scheme.base.yellow }
      }
    end,
    override_palette = function(filter)
      return {
        dark2 = "#19181a", -- bar between tree and main buf
        dark1 = background_tree, -- nvim tree
        background = background_main, -- main background
        text = "#fcfcfa",
        accent1 = "#ab9df2", -- keywords and euqals
        accent2 = "#fd971f", -- function params, braces, brackets 
        accent3 = "#a6e22e", -- strings
        accent4 = "#82aaff", -- functions and curlies 
        accent5 = "#78dce8", -- nerd tree glyphs
        accent6 = "#fd971f", -- true / false
        dimmed1 = "#78dce8", -- file tree dir
        dimmed2 = "#e8e8d0", -- file tree text
        dimmed3 = "#727072", -- comments
        dimmed4 = "#fd971f", -- line numbers vim
        dimmed5 = "#1f1f19",
        -- some overrides are applied and the comments reference the original state
      }
    end,
    override_scheme = function(scheme, palette, colors)
      return {}
    end,
  })
end

return M
