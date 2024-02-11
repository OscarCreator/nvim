vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.keymap.set("n", "<leader>grd", function()
    vim.cmd.Git("fetch --all --prune")
end)

return {
    {
        'tpope/vim-fugitive',
    },
    {
        'lewis6991/gitsigns.nvim',
        event = { 'BufReadPre', 'BufNewFile' },
        opts = {},
    },
    {
        'luukvbaal/statuscol.nvim',
        config = function ()
            local builtin = require("statuscol.builtin")
            require("statuscol").setup( {
                relculright = true,
                segments = {
                    { text = {builtin.foldfunc }, click = "v:lua.ScFa", auto = true },
                    {
                        sign = { namespace = {"diagnostic"}, maxwidth = 1, colwidth = 2, auto = true },
                        click = "v:lua.ScSa",
                    },
                    { text = {builtin.lnumfunc }, click = "v:lua.ScLa", },
                    {
                        sign = { namespace = {"gitsigns"}, name = {".*"}, maxwidth = 1, colwidth = 1, auto = false},
                        click = "v:lua.ScSa",
                    },
                }
            })
        end
    }
}
