return {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
        require('tokyonight').setup({
            style = 'night',
            on_highlights = function(highlights, _)
                highlights['@punctuation.bracket'] = { fg = '#bb9af7' }
                highlights['@punctuation.delimiter'] = { fg = '#f7768e' }
            end,
        })
    end,
}
