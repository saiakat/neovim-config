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
      b = "black",
      black = "black",
  }
return M
