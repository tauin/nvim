return require("lazy").setup({
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim", build = ":MasonUpdate" },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
		},
	},

	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"RRethy/nvim-treesitter-endwise",
			"HiPhish/nvim-ts-rainbow2",
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	{
		"nmac427/guess-indent.nvim",
		init = function()
			require("guess-indent").setup({})
		end,
	},
	{
		"windwp/nvim-autopairs",
		init = function()
			require("nvim-autopairs").setup({})
		end,
	},
	"Mofiqul/vscode.nvim",
	"nvim-lualine/lualine.nvim",
	"NvChad/nvim-colorizer.lua",
	"equalsraf/neovim-gui-shim",

	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/nvim-cmp",
	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",
	"folke/zen-mode.nvim",
	{
		"TimUntersberger/neogit",
		dependencies = { "nvim-lua/plenary.nvim" },

		init = function()
			require("neogit").setup({})
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
	},
	"simrat39/rust-tools.nvim"
})
