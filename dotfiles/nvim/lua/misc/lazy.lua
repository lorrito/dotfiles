require("lazy").setup({
	-- Necessary for some plugins
	{ "nvim-lua/plenary.nvim" },

	-- Treesitter!
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

	-- Colorscheme
	{ "catppuccin/nvim", lazy = false, priority = 1000 },

	-- Line indentation visualization
	{ "lukas-reineke/indent-blankline.nvim" },

	-- Formatting code with C-f
	{ "mhartington/formatter.nvim" },

	-- Visualize css colors from within neovim
	{
		"brenoprata10/nvim-highlight-colors",
		config = true,
	},

	-- Renaming in big projects
	{ "nvim-pack/nvim-spectre" },

	-- A plugin to work with my notes
	{ "jakewvincent/mkdnflow.nvim" },

	-- Floating terminal
	{ "akinsho/toggleterm.nvim", config = true },

	-- Telescope related plugins
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-telescope/telescope-ui-select.nvim",
		},
		branch = "0.1.x",
	},

	-- More icons for neovim
	{ "nvim-tree/nvim-web-devicons" },

	-- Vertical tree file explorer
	{ "nvim-tree/nvim-tree.lua" },

	-- Completion related
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-cmdline" },
	{ "hrsh7th/nvim-cmp" },

	-- Snippet engines
	{ "dcampos/nvim-snippy" },
	{ "dcampos/cmp-snippy" },

	-- Going from snippy to luasnip in order to use nvim-scissors
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
		dependencies = {
			"rafamadriz/friendly-snippets",
			"mlaursen/vim-react-snippets",
			"benfowler/telescope-luasnip.nvim",
		},
	},
	{ "saadparwaiz1/cmp_luasnip" },

	-- Create snippets from selection
	{ "chrisgrieser/nvim-scissors" },

	-- Buffers on top
	{ "akinsho/bufferline.nvim" },

	-- Configuration plugin for neovim's lsp
	{ "neovim/nvim-lspconfig" },

	-- Easier management of external packages, like LSP, DAP, formatters, etc.
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "WhoIsSethDaniel/mason-tool-installer.nvim" },

	-- Live actions previews
	{ "aznhe21/actions-preview.nvim", lazy = false },

	-- See some pretty diagnostics
	{ "folke/trouble.nvim" },

	-- Autopairs!
	{ "windwp/nvim-autopairs", event = "InsertEnter", config = true },

	-- Comment out and uncomment
	{ "numToStr/Comment.nvim" },
	{ "JoosepAlviste/nvim-ts-context-commentstring" },

	-- Add status line below
	{ "nvim-lualine/lualine.nvim" },
})
