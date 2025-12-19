--- @param s string
local function t(s)
    return function()
        require('telescope.builtin')[s]()
    end
end

---@param extension string extension name
---@param s string finder name
local function te(extension, s)
    return function()
        require('telescope').extensions[extension][s]()
    end
end

return {
    {
        'nvim-telescope/telescope.nvim',
        opts = {
            defaults = {
                path_display = { "smart" }
            }
        },
        dependencies = {
            { 'nvim-lua/plenary.nvim' },
            { 'ThePrimeagen/git-worktree.nvim' },
        },
        cmd = { "Telescope" },
        keys = {
            { "<leader>pf", t("find_files") },
            { "<C-p>",      t("git_files") },
            { '<leader>fg', t("live_grep") },
            { '<leader>fh', t("help_tags") },
            { '<leader>vm', t("keymaps") },
            { '<leader>vc', t("commands") },
            { '<leader>wl', te("git_worktree", "git_worktrees") },
            { '<leader>wc', te("git_worktree", "create_git_worktree") },
            { '<leader>ps', function()
                local builtin = require('telescope.builtin')
                builtin.grep_string({ search = vim.fn.input("Grep > ") })
            end
            },
            { '<leader>fw', function()
                local builtin = require('telescope.builtin')
                local word = vim.fn.expand("<cword>")
                builtin.live_grep({ default_text = word })
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
        config = function(opts)
            require("telescope").load_extension("git_worktree")
            require("telescope").setup(opts.opts)
        end
    },
}
