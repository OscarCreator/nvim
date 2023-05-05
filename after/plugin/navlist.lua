

--vim.api.nvim_set_var("navlist_cmd", "grep -oPhn 'function \\K[^()]+'")
vim.api.nvim_set_var("navlist_cmd", "grep -oPhn 'let \\K[^ ]+'")
