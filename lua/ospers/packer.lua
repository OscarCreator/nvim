-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use {
		--'nvim-telescope/telescope.nvim', tag = '0.1.0',
        '~/tools/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use({
		'rose-pine/neovim',
		as = 'rose-pine',
		config = function()
			--vim.cmd('colorscheme rose-pine')
		end
	})
	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('nvim-treesitter/playground')

	use('theprimeagen/harpoon')

	use('tpope/vim-fugitive')

    use("mbbill/undotree")

	use {
		'VonHeikemen/lsp-zero.nvim',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'saadparwaiz1/cmp_luasnip'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-nvim-lua'},

			-- Snippets
			{'L3MON4D3/LuaSnip'},
			{'rafamadriz/friendly-snippets'},
		}
    }
    -- use('~/projects/vim/navlist')

    -- use {'~/projects/vim/tree-sitter-tcl', run = 'make' }

    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

    use('rust-lang/rust.vim')

    --use({'~/personal/rsync.nvim', run = "make"})

    use {
        '~/personal/keystats.nvim', run = 'make',
    }
    use {
        '~/personal/rsync.nvim', run = 'make',
        requires = {
            {'nvim-lua/plenary.nvim'}
        },
        config = function()
            require("rsync").setup({
                fugitive_sync = true
            })
        end
    }

    -- use({"andythigpen/nvim-coverage",
    use({"~/tools/nvim-coverage/",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("coverage").setup()
        end,
    })

    use('hsanson/vim-android')

    use {
        'morhetz/gruvbox',
        config = function()
            --vim.g.gruvbox_contrast_dark = "soft"
            --vim.cmd.colorscheme("gruvbox")
        end
    }
    use{
        'ful1e5/onedark.nvim',
        config = function ()
            --vim.cmd.colorscheme("onedark")
        end
    }

    use('folke/tokyonight.nvim')

    -- tokyonight-storm ++

    use {
        "catppuccin/nvim",
        as = "catppuccin",
        config = function ()
            vim.cmd.colorscheme("catppuccin-macchiato")
        end
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    use('ThePrimeagen/git-worktree.nvim')
end)
