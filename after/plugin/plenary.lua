
vim.keymap.set("n", "<Leader>t", function()

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
