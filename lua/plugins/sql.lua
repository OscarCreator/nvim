return {
    {
        'tpope/vim-dadbod',
        cmd = {
            "DB",
            "DBCompletionClearCache",
            "DBUI",
            "DBUIAddConnection",
            "DBUIFindBuffer",
            "DBUILastQueryInfo",
            "DBUIRenameBuffer",
            "DBUIToggle"
        },
        dependencies = {
            { 'kristijanhusak/vim-dadbod-completion' },
            { 'kristijanhusak/vim-dadbod-ui' },
        }
    }
}
