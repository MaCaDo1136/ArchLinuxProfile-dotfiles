return {
    'catgoose/nvim-colorizer.lua',
    event = 'BufReadPre',
    config = function()
        require('colorizer').setup({
            filetypes = {
                '*',
                css = {
                    mode = 'virtualtext',
                    virtualtext = ' ',
                    virtualtext_inline = 'before',
                    virtualtext_mode = 'foreground',
                },
            },
            buftypes = {},
            user_commands = true,
            lazy_load = true,

            user_default_options = {
                names = true,
                names_opts = {
                    lowercase = true,
                    camelcase = true,
                },

                RGB = true,
                RRGGBB = true,
                RRGGBBAA = true,
                AARRGGBB = false,

                rgb_fn = true,
                hsl_fn = true,
                css = true,
                css_fn = true,

                tailwind = 'normal',
                tailwind_opts = {
                    update_names = false,
                },

                mode = 'background',
                always_update = false,
            },
        })
    end,
}
