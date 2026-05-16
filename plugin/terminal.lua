--- Opens a centered floating window.
--- @param opts? { width?: number, height?: number }

vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")

local state = {
  floating = {
    buf = -1,
    win = -1,
  }
}
local function create_float(opts)
  opts = opts or {}
  local screen_w = vim.o.columns
  local screen_h = vim.o.lines

  local width  = opts.width  or math.floor(screen_w * 0.8)
  local height = opts.height or math.floor(screen_h * 0.8)

  local row = math.floor((screen_h - height) / 2)
  local col = math.floor((screen_w - width)  / 2)

  local buf = nil
  if vim.api.nvim_buf_is_valid(opts.buf) then
    buf = opts.buf
  else
    buf = vim.api.nvim_create_buf(false, true)
  end

  local win_config = {
    relative = "editor",
    width    = width,
    height   = height,
    row      = row,
    col      = col,
    style    = "minimal",
    border   = "rounded",
  }

  local win = vim.api.nvim_open_win(buf, true, win_config)
  return { buf = buf, win = win }
end

local function toggle_terminal ()
  if not vim.api.nvim_win_is_valid(state.floating.win) then
    state.floating = create_float({ buf = state.floating.buf })
    if vim.bo[state.floating.buf].buftype ~= "terminal" then
      vim.cmd.terminal()
    end
  else
    vim.api.nvim_win_hide(state.floating.win)
  end
end

vim.api.nvim_create_user_command("Floaterminal", toggle_terminal, {})
vim.keymap.set({"n", "t" }, "<leader>tt", toggle_terminal)
