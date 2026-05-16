local completion = require('custom.colors.command_completions')
local palette = require('custom.colors.palette')
local color_setup = require('custom.colors.colorschemes')

local function set_styles (color, background)
  if color:find("tokyo") then
    local tokyo = require("tokyonight")
    if background == "none" then
      tokyo.setup({
        style = "night",
        transparent = true,
        styles = {
          sidebars = "transparent",
          floats = "transparent",
        },
      })
    else
      tokyo.setup({
        style = "night",
        transparent = false,
        on_colors = function (colors)
          colors.bg = background
          colors.bg_sidebar = "#191724"
        end
      })
    end
    return
  end

  if color:find("catppuccin") then
    color_setup.catppuccin()
  end

  if color:find("monokai") then
    if background == "none" then
      color_setup.monokai(nil, nil, true)
    else
      color_setup.monokai(background, palette.backgrounds.rose, false)
    end
  end
end

local function set_colors(color, background)
  local defaults = {
    scheme="rose-pine-moon",
    back="none",
  }

  if color == "rose-pine" then
    color = "rose-pine-moon"
  end

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
      local forced_background
      if normalized:find("monokai") then forced_background = "crust" end
      local args = vim.split(opts.args, "%s+", { trimempty = true })
      local background = args[1] or forced_background or "black"
      set_colors(normalized, background)
    end,
    {
      nargs = "*",
      complete = completion.completer,
    }
  )
end

set_colors()

-- Keybinds -- 

vim.keymap.set('n', '<leader>cc', function ()
  set_colors("catppuccin", "crust")
end)

vim.keymap.set('n', '<leader>ct', function ()
  set_colors("tokyonight", "black")
end)

vim.keymap.set('n', '<leader>cs', function ()
  set_colors("monokai-pro", "crust")
end)

vim.keymap.set('n', '<leader>cr', function ()
  set_colors("rose-pine-moon", "none")
end)
