require("lazy").setup({
	-- Necessary for some plugins
	{ "nvim-lua/plenary.nvim" },

	-- Treesitter!
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

	-- Colorscheme(s)
	{ "rebelot/kanagawa.nvim", lazy = false, priority = 1000 },

	-- Line indentation visualization
	{ "lukas-reineke/indent-blankline.nvim" },

	-- Formatting code with C-f
	{ "mhartington/formatter.nvim" },

	-- Visualize css colors from within neovim
	{ "norcalli/nvim-colorizer.lua" },

	-- Renaming-related plugins
	{ "nvim-pack/nvim-spectre" },
	{ "smjonas/inc-rename.nvim", config = true },

	-- A plugin to work with my notes
	{ "jakewvincent/mkdnflow.nvim" },

	-- Floating terminal
	{ "akinsho/toggleterm.nvim", config = true },

	-- Telescope related plugins
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
			},
			"nvim-telescope/telescope-ui-select.nvim",
		},
		branch = "0.1.x",
	},

	-- More icons for neovim
	{ "nvim-tree/nvim-web-devicons", config = true },

	-- Vertical tree file explorer
	{ "nvim-tree/nvim-tree.lua" },

	-- Completion related
	{ "hrsh7th/nvim-cmp", lazy = false },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-cmdline" },
	{ "hrsh7th/cmp-nvim-lsp-signature-help" },
	{ "saadparwaiz1/cmp_luasnip" },

	-- Going from snippy to luasnip in order to use nvim-scissors
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v2.*",
		build = "make install_jsregexp",
		dependencies = {
			"rafamadriz/friendly-snippets",
			"mlaursen/vim-react-snippets",
			"benfowler/telescope-luasnip.nvim",
		},
	},

	-- Create snippets from selection
	{ "chrisgrieser/nvim-scissors" },

	-- Buffers on top
	{ "akinsho/bufferline.nvim" },

	-- Close buffers
	{ "echasnovski/mini.nvim", version = false },

	-- Configuration plugin for neovim's lsp
	{ "neovim/nvim-lspconfig", event = { "BufReadPre", "BufNewFile" } },

	-- Easier management of external packages, like LSP, DAP, formatters, etc.
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "WhoIsSethDaniel/mason-tool-installer.nvim" },

	-- Live actions previews
	{ "aznhe21/actions-preview.nvim" },

	-- See some pretty diagnostics
	{ "folke/trouble.nvim" },

	-- Autopairs!
	{ "windwp/nvim-autopairs", event = "InsertEnter", config = true },

	-- Comment out and uncomment
	{ "numToStr/Comment.nvim" },
	{ "JoosepAlviste/nvim-ts-context-commentstring" },

	-- Add status line below
	{ "nvim-lualine/lualine.nvim", lazy = false },
})
