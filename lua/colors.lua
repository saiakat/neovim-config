local function set_colors(color, background)
  local defaults = {
    scheme="rose-pine-moon",
    back="none",
  }
  if color == '.' then
    color = defaults.scheme
  end
  if background == '.' then
    background = defaults.back
  end
  color = color or defaults.scheme
  background = background or defaults.back
  vim.cmd.colorscheme(color);

  vim.api.nvim_set_hl(0, "Normal", { bg=background })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg=background })
  vim.api.nvim_set_hl(0, "NormalNC",    { bg=background })
end

local completion = require('lua.command_completions')

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
