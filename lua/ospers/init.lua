require("ospers.remap")
require("ospers.set")

vim.api.nvim_create_autocmd({"BufEnter", "BufFilePost"}, {
    pattern = {"*.tmp"},
    callback = function(ev)

        vim.lsp.start({
            name = 'hellols test',
            cmd = {'/home/ospers/projects/java/hellols/launcher/target/hellols'},
            root_dir = vim.fs.dirname(vim.fs.find({'.git'}, { upward = true })[1]),
        })
    end
})
