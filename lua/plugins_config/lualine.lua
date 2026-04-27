require('lualine').setup({
    options = {
        theme = 'rose-pine',
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
