return {
    'salkin-mada/openscad.nvim',
    cmd = {
        'OpenscadCheatsheet',
        'OpenscadExecFile',
        'OpenscadHelp',
        'OpenscadManual',
        'OpenscadTopToggle'
    },
    ft = 'openscad',
    config = function()
        -- load snippets, note requires
        vim.g.openscad_load_snippets = true
        require('openscad')
    end,
    dependencies = { "L3MON4D3/LuaSnip", "junegunn/fzf.vim" },
}
