function TransparentBackground(color, background)
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

vim.api.nvim_create_user_command(
 'Colors',
 function (opts)
  local args = vim.split(opts.args, "%s+", { trimempty = true })
  local color = args[1]
  local background = args[2]
  TransparentBackground(color, background)
 end,
 {
  nargs = '*'
 }
)
