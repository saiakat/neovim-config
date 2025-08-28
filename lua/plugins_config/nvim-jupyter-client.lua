require('nvim-jupyter-client').setup({
    template = {
        cells = {
            {
                cell_type = "code",
                execution_count = nil,
                metadata = {},
                outputs = {},
                source = {"# Custom template cell\n"}
            }
        },
        metadata = {
            kernelspec = {
                display_name = "Python 3",
                language = "python",
                name = "python3"
            }
        },
        nbformat = 4,
        nbformat_minor = 5
    },
    cell_highlight_group = "CurSearch", --whatever you want here
    -- If custom highlight group then set these manually
    highlights = {
        cell_title = {
            fg = "#ffffff",
            bg = "#000000",
        }
    }
})
