local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
-- requires another plugin

vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

-- todo
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
--vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>vm', builtin.keymaps, {})
vim.keymap.set('n', '<leader>vc', builtin.commands, {})

-- wl wc

require("telescope").load_extension("git_worktree")

local worktree = require('telescope').extensions.git_worktree

vim.keymap.set('n', '<leader>wl', worktree.git_worktrees, {})
vim.keymap.set('n', '<leader>wc', worktree.create_git_worktree, {})
