return {
    cmd = {
        'typescript-language-server',
        '--stdio',
    },
    filetypes = {
        'javascript',
        'javascriptreact',
        'javascript.jsx',
        'typescript',
        'typescriptreact',
        'typescript.tsx',
    },
    root_markers = {
        'tsconfig.json',
        'jsconfig.json',
        'package.json',
        '.git',
    },

    init_options = {
        hostInfo = 'neovim',
        preferences = {
            disableSuggestions = true,
            organizeImports = true,
        },
    },
    single_file_support = true,
}
