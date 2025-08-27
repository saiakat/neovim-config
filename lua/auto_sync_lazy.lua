vim.api.nvim_create_autocmd("User", {
    pattern = "LazyVimStarted",
    desc = "Sync plugins",
    callback = function()
      local start_time = os.clock()
      require('lazy').sync({ wait = false, show = false })
      local end_time = os.clock()
      print(vim.print("Lazy plugins synced in " .. (end_time - start_time) * 1000 .. "ms"))
    end,
})
