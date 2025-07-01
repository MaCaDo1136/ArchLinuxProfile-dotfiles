return {
    'nvim-treesitter/nvim-treesitter',
    event = { 'BufReadPost', 'BufNewFile' },
    build = ':TSUpdate',
    config = function()
        require('nvim-treesitter.configs').setup({
            ensure_installed = {
                'c',
                'cpp',
                'lua',
                'javascript',
                'typescript',
                'html',
                'css',
                'rust',
                'go',
                'python',
                'vim',
                'vimdoc',
            },
            highlight = {
                enable = true,
                use_languagetree = true,
                additional_vim_regex_highlighting = false,
            },
            indent = { enable = true },
        })
    end,
}
