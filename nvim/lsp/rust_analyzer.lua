return {
    cmd = { 'rust-analyzer' },
    filetypes = {
        'rust',
    },
    root_markers = {
        'Cargo.toml',
        '.git',
    },

    single_file_support = true,
    capabilities = {
        experimental = {
            serverStatusNotification = true,
        },
    },
}
