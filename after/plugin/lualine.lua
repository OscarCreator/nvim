
require('lualine').setup {
    sections = {
        lualine_x = {"require('keystats').get_count()", 'encoding', 'fileformat', 'filetype'},
    }
}
