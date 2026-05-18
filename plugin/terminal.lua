--- Opens a centered floating window.
--- @param opts? { width?: number, height?: number }

vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")

local state = {
  floating = {
    buffers = { -1, -1 },
    win = -1,
  },
  current_buf = -1,
}

local function create_float(opts)
  opts = opts or {}
  local screen_w = vim.o.columns
  local screen_h = vim.o.lines
  local width  = opts.width  or math.floor(screen_w * 0.8)
  local height = opts.height or math.floor(screen_h * 0.8)
  local row = math.floor((screen_h - height) / 2)
  local col = math.floor((screen_w - width)  / 2)

  -- validate/create each named buffer in place
  local buffers = opts.buffers
  for i, buf in ipairs(buffers) do
    if not vim.api.nvim_buf_is_valid(buf) then
      buffers[i] = vim.api.nvim_create_buf(false, true)
    end
  end

  local win = vim.api.nvim_open_win(buffers[1], true, {
    relative = "editor",
    width    = width,
    height   = height,
    row      = row,
    col      = col,
    style    = "minimal",
    border   = "rounded",
  })

  return { buffers = buffers, win = win }
end

local function to_terminal (buf)
  if vim.bo[buf].buftype ~= "terminal" then
    vim.cmd.terminal()
  end
end

local function toggle_terminal ()
  if not vim.api.nvim_win_is_valid(state.floating.win) then
    state.floating = create_float({ buffers = state.floating.buffers })
    to_terminal(state.floating.buffers[1])
    state.current_buf = 1
  else
    vim.api.nvim_win_hide(state.floating.win)
  end
end

local function switch_buf (buf, get_next)
  get_next = get_next or false

  if get_next then
    if next(state.floating.buffers, buf) then
      buf = buf + 1
    else
      buf = 1
    end
  end

  local buffer = state.floating.buffers[buf]
  vim.api.nvim_set_current_buf(buffer)
  to_terminal(buffer)
  state.current_buf = buf
end

local function create_buffer () 
  local i = #state.floating.buffers + 1
  state.floating.buffers[i] = vim.api.nvim_create_buf(false, true)
end

vim.api.nvim_create_user_command("Floaterminal", toggle_terminal, {})
vim.keymap.set({"n", "t" }, "<leader>tt", toggle_terminal)
vim.keymap.set({"n", "t" }, "<leader>1", function() switch_buf(1, false) end)
vim.keymap.set({"n", "t" }, "<leader>2", function() switch_buf(2, false) end)
vim.keymap.set({"n", "t" }, "<leader>n", function() switch_buf(state.current_buf, true) end)
vim.keymap.set({"n", "t" }, "<leader>b", function() create_buffer() end)
