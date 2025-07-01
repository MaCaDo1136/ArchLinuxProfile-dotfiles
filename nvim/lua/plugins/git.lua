return {
    { 'tpope/vim-fugitive' },
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup({
                signs = {
                    add = { text = '' },
                    change = { text = '│' },
                    delete = { text = '' },
                    topdelete = { text = '‾' },
                    changedelete = { text = '󰏬' },
                    untracked = { text = '│' },
                },
            })
        end,
    },
    {
        'kdheepak/lazygit.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        keys = {
            {
                '<leader>gg',
                '<cmd>LazyGit<cr>',
                desc = 'LazyGit',
            },
        },
    },
}
