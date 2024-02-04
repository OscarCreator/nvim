return {
    {
        'OscarCreator/rsync.nvim',
        dev = false,
        build = 'make',
        dependencies = {
            { 'nvim-lua/plenary.nvim' }
        },
        opts = {}
    },
}
