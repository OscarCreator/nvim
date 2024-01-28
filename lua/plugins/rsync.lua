return {
    {
        dir = '~/personal/rsync.nvim',
        build = 'make',
        dependencies = {
            { 'nvim-lua/plenary.nvim' }
        },
        config = {
            fugitive_sync = true
        }
    },
}
