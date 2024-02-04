return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1100,
        lazy = true
    },
    {
        "sainnhe/gruvbox-material",
        priority = 1100,
        lazy = true,
    },
    {
        "JManch/sunset.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            day_callback = function()
                vim.cmd.colorscheme("gruvbox-material")
            end,
            night_callback = function()
                vim.cmd.colorscheme("catppuccin-macchiato")
            end,
            sunrise_override = "6:00",
            sunset_override = "18:00",
        }
    }
}
