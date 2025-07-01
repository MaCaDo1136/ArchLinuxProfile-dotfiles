return {
    { 'dstein64/vim-startuptime' },
    { 'nvim-lua/plenary.nvim' },
    {
        'nvim-tree/nvim-web-devicons',
        config = function()
            require('nvim-web-devicons').setup({})
        end,
    },
}
