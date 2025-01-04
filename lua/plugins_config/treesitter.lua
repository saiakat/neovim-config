require('nvim-treesitter.configs').setup{
    ensure_installed = { "c", "lua", "python", "javascript", "typescript"},

    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
    },
}