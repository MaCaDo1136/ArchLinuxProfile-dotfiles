return {
    cmd = { 'intelephense', '--stdio' },
    filetypes = { 'php' },
    settings = {
        intelephense = {
            files = {
                maxSize = 5000000,
            },
            environment = {
                includePaths = {
                    './vendor', -- for Composer packages
                },
            },
            diagnostics = {
                enable = true,
            },
            completion = {
                fullyQualifyGlobalConstantsAndFunctions = true,
            },
            format = {
                enable = false,
            },
        },
    },
}
