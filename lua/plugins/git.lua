vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.keymap.set("n", "<leader>grd", function()
    vim.cmd.Git("fetch --all --prune")
end)

return {
    {
        'tpope/vim-fugitive',
    },
    {
        'ThePrimeagen/git-worktree.nvim',
        priority = 100,
    },
}
