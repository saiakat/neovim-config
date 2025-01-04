require('lualine').setup({
    options = {
        theme = 'tokyonight-night',
        icons_enabled = true,
    },
    sections = {
        lualine_a = {{
            'filename',
            parh = 1,
        }},
    },
    tabline = {},
    extensions = {},
})