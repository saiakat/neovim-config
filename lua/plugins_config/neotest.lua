local neotest = require('neotest')
neotest.setup({
  adapters = {
    require("neotest-vitest"),
    require("neotest-plenary"),
  },
})

vim.keymap.set("n", "<leader>tc", function()
  neotest.run.run()
end)

vim.keymap.set("n", "<leader>tf", function()
  neotest.run.run(vim.fn.expand("%"))
end)

vim.keymap.set("n", "<leader>tw", function()
  neotest.watch.toggle(vim.fn.expand("%"))
end)

vim.keymap.set("n", "<leader>to", function()
  require("neotest").output.open({ enter = true })
end)

