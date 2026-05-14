return {
  {'rose-pine/neovim', name = 'rose-pine'},
  {'catppuccin/nvim', name = 'catppuccin'},
  {
  "folke/tokyonight.nvim",
  lazy = false,
  opts = {},
  name = 'tokyonight'
  },
  {
    'nvim-treesitter/nvim-treesitter',
    lazy=false,
    branch='main',
    build = ':TSUpdate',
    config = function()
      require("plugins_config.treesitter")
    end,
  },
}
