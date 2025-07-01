return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local mode = {
            'mode',
            fmt = function(str)
                return ' ' .. str
            end,
            color = { gui = 'bold' },
        }
        local sep = { '%=' }
        local lsp = {
            function()
                local msg = '[LSP]'
                local buf_clients = vim.lsp.get_clients({ bufnr = 0 })
                if #buf_clients == 0 then
                    return msg
                end
                return '[' .. buf_clients[1].name .. ']'
            end,
            icon = '',
            color = { fg = '#f7768e' },
        }

        require('lualine').setup({
            options = {
                globalstatus = true,
                -- disabled_filetypes = { 'NvimTree' },
                component_separators = { left = '', right = '|' },
                section_separators = { left = '', right = '' },
            },
            sections = {
                lualine_a = { mode },
                lualine_b = { 'filename' },
                lualine_c = {
                    'branch',
                    { 'diff', symbols = { added = ' ', modified = '󰏬 ', removed = ' ' } },
                    sep,
                    {
                        'diagnostics',
                        symbols = {
                            error = ' ',
                            warn = ' ',
                            hint = ' ',
                            info = ' ',
                        },
                    },
                    lsp,
                },
                lualine_x = { 'encoding', 'fileformat', 'filetype' },
                lualine_y = { 'progress' },
                lualine_z = { 'location' },
            },
        })
    end,
}
