require('nvim-treesitter.configs').setup{
    ensure_installed = { "c", "lua", "python", "javascript", "typescript", "html", "css", "json", "bash", "dockerfile", "go", "rust", "java", "php", "ruby", "toml", "vim", "yaml" },

    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
    },
}