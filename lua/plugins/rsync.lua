return {
    {
        dir = '~/personal/rsync.nvim',
        build = 'make',
        dependencies = {
            { 'nvim-lua/plenary.nvim' }
        },
        config = function()
            require("rsync").setup({
                fugitive_sync = true
            })
        end
    },
}
