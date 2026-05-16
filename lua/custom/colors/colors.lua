local completion = require('custom.colors.command_completions')
local palette = require('custom.colors.palette')

local function set_styles (color, background)
  if color:find("tokyo") then
    if background == "none" then
      require("tokyonight").setup({
        style = "night",
        transparent = true,
        styles = {
          sidebars = "transparent",
          floats = "transparent",
        },
      })
    else
      require("tokyonight").setup({
        style = "night",
        transparent = false,
        on_colors = function (colors)
          colors.bg = background
          colors.bg_sidebar = background
        end
      })
    end
    return
  end

  if color:find("ofirkai") then
    local sublime = require('ofirkai')
    local scheme = sublime.scheme

    if background == "none" then
    scheme.background = ""
    scheme.sidebar_bg = ""

      sublime.setup({
        scheme = scheme,
        remove_italics = true,
      })

    else
      scheme.background = background
      -- scheme.sidebar_bg = "#000000"

      sublime.setup({
        scheme = scheme,
        remove_italics = true,
      })
    end
  end

end

local function set_colors(color, background)
  print(color)
  local defaults = {
    scheme="rose-pine-moon",
    back="none",
  }

  if not palette.contains(palette.colors, color) then
    color = defaults.scheme
  end
  if palette.backgrounds[background] ~= nil then
    background = palette.backgrounds[background]
  else
    background = defaults.back
  end

  set_styles(color, background)
  vim.cmd.colorscheme(color);
  vim.api.nvim_set_hl(0, "Normal", { bg=background })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg=background })
  vim.api.nvim_set_hl(0, "NormalNC",    { bg=background })

end

vim.api.nvim_create_user_command(
 'Colors',
 function (opts)
  local args = vim.split(opts.args, "%s+", { trimempty = true })
  local color = args[1]
  local background = args[2]
  set_colors(color, background)
 end,
 {
  nargs = "*",
  complete = completion.completer,
 }
)

for k, v in pairs(palette.custom_schemes) do
  local normalized = k
  if k:find("_") then
    normalized = k:gsub("_", "-")
  end
  vim.api.nvim_create_user_command(
    v,
    function (opts)
      local args = vim.split(opts.args, "%s+", { trimempty = true })
      local background = args[1] or "black"
      set_colors(normalized, background)
    end,
    {
      nargs = "*",
      complete = completion.completer,
    }
  )
end

set_colors()
