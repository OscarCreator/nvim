return {
    {
        'nvim-lualine/lualine.nvim',
        lazy = false,
        dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true },
        opts = {
            sections = {
                lualine_b = { 'branch', function()
                    local res, match = vim.fn.FugitiveGitDir():gsub(".*worktrees/", "")
                    if match == 1 then
                        return res
                    else
                        return ""
                    end
                end, 'diff', 'diagnostics' },
                lualine_x = {
                    'encoding',
                    'fileformat',
                    'filetype'
                },
            }
        }
    },
}
