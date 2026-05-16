local palette_backgrounds = require("custom.colors.palette").backgrounds
local relevant_schemes = require("custom.colors.palette").custom_schemes
local M = {}

function M.completer(arg_lead, cmd_line)
  local all_colors = vim.fn.getcompletion('', 'color')
  local candidates_color = {}
  local candidates_background = {}
  local suggestions = {}

  for k, _ in pairs(relevant_schemes) do
    local normalized = k
    if k:find("_") then normalized = k:gsub("_","-") end
    for _, v in ipairs(all_colors) do
      if v:find(normalized, 1, true) then
        table.insert(candidates_color, v)
      end
    end
  end

  for k, _ in pairs(palette_backgrounds) do
    table.insert(candidates_background, k)
  end
  -- Split the command line to count arguments
  local args = {}
  for word in cmd_line:gmatch("%S+") do
    table.insert(args, word)
  end

  -- Determine which argument we're completing
  -- args[1] is the command name, args[2] is first arg, args[3] is second arg
  local arg_count = #args

  -- If we're typing and the current word is not complete, we're completing that position
  -- If we just finished a word (trailing space), we're completing the next position
  local completing_arg_num
  if cmd_line:sub(-1) == " " then
    completing_arg_num = arg_count  -- Completing next argument
  else
    completing_arg_num = arg_count - 1  -- Completing current argument
  end

  -- Choose candidates based on argument position
  local candidates
  if completing_arg_num == 1 then
    -- First argument: color theme
    candidates = candidates_color
  elseif completing_arg_num == 2 then
    -- Second argument: background
    candidates = candidates_background
  else
    -- No more arguments supported
    return {}
  end

  for _, v in pairs(relevant_schemes) do
    if cmd_line:find(v, 1, true) then
      candidates = candidates_background
    end
  end
  -- Filter candidates based on what user has typed so far
  for _, candidate in ipairs(candidates) do
    if candidate:find(arg_lead, 1, true) then -- Case-sensitive prefix match
      table.insert(suggestions, candidate)
    end
  end

  return suggestions
end

return M
