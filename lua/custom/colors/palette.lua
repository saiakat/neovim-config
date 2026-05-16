local M = {}

function M.contains(list, value)
  for _, v in ipairs(list) do
    if v == value then
      return true
    end
  end
  return false
end

M.colors = vim.fn.getcompletion('', 'color')
M.backgrounds = {
      rose = "#191724",
      tokyo = "#1a1b26",
      t = "#1a1b26",
      black = "#000000",
      b = "#000000",
      mantle = "#181825",
      m = "#181825",
      crust = "#11111b",
      c = "#11111b",
      sublime = "#1f1f19",
      s = "#1f1f19",
  }

M.custom_schemes = {
  catppuccin = "Cap",
  tokyonight = "Tokyo",
  rose_pine = "Rose",
  ofirkai = "Sublime",
}

return M;
