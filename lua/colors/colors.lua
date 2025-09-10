local completion = require('colors.command_completions')
local utils = require('colors.utils')

local function set_colors(color, background)
  local defaults = {
    scheme="rose-pine-moon",
    back="none",
  }

  if not utils.contains(utils.colors, color) then
    color = defaults.scheme
  end
  if utils.backgrounds[background] ~= nil then
    background = utils.backgrounds[background]
  else
    background = defaults.back
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

set_colors()
