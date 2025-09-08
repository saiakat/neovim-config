local M = {}

function M.completer(arg_lead, cmd_line)
  local candidates_color = vim.fn.getcompletion('', 'color')
  local candidates_background = { "none", "black" }
  local suggestions = {}

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

  -- Filter candidates based on what user has typed so far
  for _, candidate in ipairs(candidates) do
    if candidate:find(arg_lead, 1, true) then -- Case-sensitive prefix match
      table.insert(suggestions, candidate)
    end
  end

  return suggestions
end

return M
