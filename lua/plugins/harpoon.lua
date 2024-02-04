--- @param i number
local function h_nav(i)
    return function()
        require("harpoon.ui").nav_file(i)
    end
end

return {
    {
        'theprimeagen/harpoon',
        dependencies = { 'nvim-lua/plenary.nvim' },
        keys = {
            { "<leader>a", function()
                require("harpoon.mark").add_file()
            end
            },
            { "<C-e>", function()
                local ui = require("harpoon.ui")
                ui.toggle_quick_menu()
            end
            },
            { "<C-h>", h_nav(1) },
            { "<C-t>", h_nav(2) },
            { "<C-n>", h_nav(3) },
            { "<C-s>", h_nav(4) },
        },
    },
}
