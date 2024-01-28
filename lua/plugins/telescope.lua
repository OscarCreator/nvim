return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            { 'nvim-lua/plenary.nvim' },
        },
        init = function()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
            vim.keymap.set('n', '<C-p>', builtin.git_files, {})

            vim.keymap.set('n', '<leader>ps', function()
                builtin.grep_string({ search = vim.fn.input("Grep > ") })
            end)

            vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
            vim.keymap.set('n', '<leader>vm', builtin.keymaps, {})
            vim.keymap.set('n', '<leader>vc', builtin.commands, {})

            require("telescope").load_extension("git_worktree")

            local worktree = require('telescope').extensions.git_worktree

            vim.keymap.set('n', '<leader>wl', worktree.git_worktrees, {})
            vim.keymap.set('n', '<leader>wc', worktree.create_git_worktree, {})

            ----- plenary ----
            vim.keymap.set("n", "<leader>t", function()
                local cur_path = vim.fn.expand("%:p:h")

                while cur_path and vim.fn.finddir("tests", cur_path) == "" do
                    cur_path = cur_path:match("(.*)/.*")
                end

                if cur_path then
                    require("plenary.test_harness").test_directory(cur_path .. "/tests", {
                        minimal_init = cur_path .. "/tests/minimal_init.lua",
                    })
                end
            end, {
                silent = true,
            })
        end
    },
}
