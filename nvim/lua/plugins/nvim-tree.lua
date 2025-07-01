return {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    lazy = false,
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    config = function()
        require('nvim-tree').setup({
            filters = { dotfiles = false },
            disable_netrw = true,
            hijack_cursor = true,
            sync_root_with_cwd = true,
            update_focused_file = {
                enable = true,
                update_root = false,
            },
            view = {
                width = 30,
                side = 'right',
                preserve_window_proportions = true,
            },
            git = {
                enable = false,
                ignore = true,
            },
            renderer = {
                root_folder_label = false,
                indent_markers = { enable = true },
                icons = {
                    glyphs = {
                        default = '󰈚',
                        folder = {
                            default = '',
                            empty = '',
                            empty_open = '',
                            open = '',
                            symlink = '',
                        },
                    },
                },
            },
        })
    end,
}
