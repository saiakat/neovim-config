require('options')
require('keymaps')
require('plugins')
require('colorscheme')
require('plugins_config')
require('auto_sync_lazy')

local function path_exists(path)
  local file, err = io.open(path, "r")
  if file then
    file:close()
    return true
  elseif err and err:find("No such file or directory") then
    return false
  else
    -- Handle other potential errors, e.g., permissions
    return false -- Or handle as needed
  end
end

local home = os.getenv("HOME")
if path_exists(home .. '/.config/nvim/lua/colors.lua') then
  require('colors')
end
