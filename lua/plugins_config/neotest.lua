local neotest = require('neotest')
neotest.setup({
  adapters = {
    require("neotest-vitest"),
    require("neotest-plenary"),
    require("neotest-jest"),
  },
})

-- run nearest test
vim.keymap.set("n", "<leader>tc", function()
  neotest.run.run()
end)

-- run current file
vim.keymap.set("n", "<leader>tf", function()
  neotest.run.run(vim.fn.expand("%"))
end)

-- watch test
vim.keymap.set("n", "<leader>tw", function()
  neotest.watch.toggle(vim.fn.expand("%"))
end)

-- see test output
vim.keymap.set("n", "<leader>to", function()
  require("neotest").output.open({ enter = true })
end)

