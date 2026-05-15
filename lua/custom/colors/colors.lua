local completion = require('custom.colors.command_completions')
local palette = require('custom.colors.palette')

local function set_colors(color, background)
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

  print(background)

  if string.find(color, "tokyo") then
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
  end

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

vim.api.nvim_create_user_command(
 'Tokyo',
 function (opts)
  local args = vim.split(opts.args, "%s+", { trimempty = true })
  local background = args[1] or "black"
  set_colors("tokyonight", background)
 end,
 {
  nargs = "*",
  complete = completion.completer,
 }
)

vim.api.nvim_create_user_command(
 'Cap',
 function (opts)
  local args = vim.split(opts.args, "%s+", { trimempty = true })
  local background = args[1] or "crust"
  set_colors("catppuccin", background)
 end,
 {
  nargs = "*",
  complete = completion.completer,
 }
)

set_colors()
