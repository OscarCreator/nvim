return {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true },
        config = function()
            require('lualine').setup {
                sections = {
                    lualine_b = { 'branch', function()
                        local res, match = vim.fn.FugitiveGitDir():gsub(".*worktrees/", "")
                        if match == 1 then
                            return res
                        else
                            return ""
                        end
                    end, 'diff', 'diagnostics' },
                    lualine_x = { "require('keystats').get_count()", 'encoding', 'fileformat', 'filetype' },
                }
            }
        end
    },
}