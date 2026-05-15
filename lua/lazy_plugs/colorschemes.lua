return {
  { "folke/tokyonight.nvim" },
  -- my favorite colorscheme. Colorscheme on startup can be changed in lua/colorscheme.lua
  { 'rose-pine/neovim', as = 'rose-pine' },
  -- treesitte not a colorschmeme. But for better syntax highlighting
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
