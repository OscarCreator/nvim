return {
    {
        dir = '~/personal/rsync.nvim',
        build = 'make',
        dependencies = {
            { 'nvim-lua/plenary.nvim' }
        },
        opts = {
            fugitive_sync = true
        }
    },
}
