return {
    {
        'folke/neodev.nvim',
        config = {}
    },
    {
        'sourcegraph/sg.nvim',
        build = 'nvim -l build/init.lua',
        config = {},
    },
    { 'rust-lang/rust.vim' },
    {
        {
            'VonHeikemen/lsp-zero.nvim',
            branch = 'v3.x',
            lazy = true,
            config = false,
            init = function()
                -- Disable automatic setup, we are doing it manually
                vim.g.lsp_zero_extend_cmp = 0
                vim.g.lsp_zero_extend_lspconfig = 0
            end,
        },
        {
            'williamboman/mason.nvim',
            lazy = false,
            config = true,
        },


        -- Autocompletion
        {
            'hrsh7th/nvim-cmp',
            event = 'InsertEnter',
            dependencies = {
                { 'L3MON4D3/LuaSnip' },
            },
            config = function()
                -- Here is where you configure the autocompletion settings.
                local lsp_zero = require('lsp-zero')
                -- TODO removed? lsp_zero.preset('recommended')
                lsp_zero.extend_cmp()

                -- And you can configure cmp even more, if you want to.
                local cmp = require('cmp')
                local luasnip = require('luasnip')
                local cmp_select = { behavior = cmp.SelectBehavior.Select }
                local cmp_action = lsp_zero.cmp_action()

                local has_words_before = function()
                    unpack = unpack or table.unpack
                    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                    return col ~= 0 and
                        vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
                end
                lsp_zero.set_preferences({
                    sign_icons = {
                        error = 'E',
                        warn = 'W',
                        hint = 'H',
                        info = 'I',
                    }
                })

                vim.diagnostic.config({
                    virtual_text = true,
                    update_in_insert = true,
                })

                cmp.setup({
                    sources = {
                        { name = "cody" },
                        { name = "nvim_lsp" },
                    },
                    experimental = { ghost_text = true },
                    formatting = lsp_zero.cmp_format(),
                    mapping = cmp.mapping.preset.insert({
                        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                        ['<C-Space>'] = cmp.mapping.complete(),
                        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                        ['<C-d>'] = cmp.mapping.scroll_docs(4),
                        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
                        ['<C-b>'] = cmp_action.luasnip_jump_backward(),
                        -- TODO learn above instead?
                        --["<Tab>"] = cmp.mapping(function(fallback)
                        --    if cmp.visible() then
                        --        cmp.select_next_item()
                        --    elseif luasnip.expand_or_jumpable() then
                        --        luasnip.expand_or_jump()
                        --    elseif has_words_before() then
                        --        cmp.complete()
                        --    else
                        --        fallback()
                        --    end
                        --end, { "i", "s" }),
                        --["<S-Tab>"] = cmp.mapping(function(fallback)
                        --    if cmp.visible() then
                        --        cmp.select_prev_item()
                        --    elseif luasnip.jumpable(-1) then
                        --        luasnip.jump(-1)
                        --    else
                        --        fallback()
                        --    end
                        --end, { "i", "s" }),
                    })
                })
            end
        },
        {
            'L3MON4D3/LuaSnip',
            dependencies = {
                'rafamadriz/friendly-snippets'
            }
        },

        -- LSP
        {
            'neovim/nvim-lspconfig',
            cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
            event = { 'BufReadPre', 'BufNewFile' },
            dependencies = {
                { 'hrsh7th/cmp-nvim-lsp' },
                { 'williamboman/mason-lspconfig.nvim' },
                { 'hrsh7th/cmp-buffer' },
                { 'hrsh7th/cmp-path' },
                { 'saadparwaiz1/cmp_luasnip' },
                { 'hrsh7th/cmp-nvim-lua' },

            },
            config = function()
                -- This is where all the LSP shenanigans will live
                local lsp_zero = require('lsp-zero')
                lsp_zero.extend_lspconfig()

                --- if you want to know more about lsp-zero and mason.nvim
                --- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
                lsp_zero.on_attach(function(client, bufnr)
                    -- see :help lsp-zero-keybindings
                    -- to learn the available actions
                    -- TODO not needed? lsp_zero.default_keymaps({ buffer = bufnr })
                    local lsp_group = vim.api.nvim_create_augroup("LspGroup", {})

                    local opts = { buffer = bufnr, remap = false }

                    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
                    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
                    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
                    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
                    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
                    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
                    -- vim.keymap.set("n", "<space>e", function() vim.diagnostic.show_line_diagnostics() end, opts)
                    vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
                    vim.keymap.set("n", "<leader>rr", function() vim.lsp.buf.references() end, opts)
                    vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
                    vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end, opts)
                    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

                    if client.supports_method("textDocument/formatting") then
                        vim.api.nvim_clear_autocmds({ group = lsp_group, buffer = bufnr })
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            group = lsp_group,
                            buffer = bufnr,
                            callback = function()
                                vim.lsp.buf.format()
                            end
                        })
                    end
                end)

                require('mason-lspconfig').setup({
                    ensure_installed = {
                        "lua_ls",
                        "rust_analyzer",
                    },
                    handlers = {
                        lsp_zero.default_setup,
                        lua_ls = function()
                            -- (Optional) Configure lua language server for neovim
                            local lua_opts = lsp_zero.nvim_lua_ls()
                            require('lspconfig').lua_ls.setup(lua_opts)
                        end,
                    }
                })
            end
        }
    }
}
