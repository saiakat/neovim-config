-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use "folke/tokyonight.nvim"
    use { "catppuccin/nvim", as = "catppuccin" }
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
    use 'nvim-tree/nvim-tree.lua'
    use 'nvim-tree/nvim-web-devicons'
    use 'nvim-lualine/lualine.nvim'
    use { "nvim-telescope/telescope.nvim",
    requires = { "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim" } }
    use { "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig", }
    require('packer').sync()
end)
