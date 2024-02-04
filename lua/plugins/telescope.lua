local function t(s)
    return function()
        return require('telescope.builtin')[s]
    end
end

return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            { 'nvim-lua/plenary.nvim' },
            { 'ThePrimeagen/git-worktree.nvim'},
        },
        cmd = { "Telescope" },
        keys = {
            { "<leader>pf", t("find_files") },
            { "<C-p>",      t("git_files") },
            { '<leader>fg', t("live_grep") },
            { '<leader>fh', t("help_tags") },
            { '<leader>vm', t("keymaps") },
            { '<leader>vc', t("commands") },
            { '<leader>wl', t("extensions.git_worktree.git_worktrees") },
            { '<leader>wl', t("extensions.git_worktree.create_git_worktree") },
            { '<leader>ps', function()
                local builtin = require('telescope.builtin')
                builtin.grep_string({ search = vim.fn.input("Grep > ") })
            end
            },
            {
                "<leader>t",
                function()
                    local cur_path = vim.fn.expand("%:p:h")

                    while cur_path and vim.fn.finddir("tests", cur_path) == "" do
                        cur_path = cur_path:match("(.*)/.*")
                    end

                    if cur_path then
                        require("plenary.test_harness").test_directory(cur_path .. "/tests", {
                            minimal_init = cur_path .. "/tests/minimal_init.lua",
                        })
                    end
                end,
                silent = true,
            }
        },
        config = function()
            require("telescope").load_extension("git_worktree")
        end
    },
}
