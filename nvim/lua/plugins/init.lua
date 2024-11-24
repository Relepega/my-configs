return {
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" }, -- uncomment for format on save
		lazy = false,
		config = require "configs.conform",
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require "configs.lspconfig"
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = require "configs.treesitter",
	},
	{
		"stevearc/oil.nvim",
		lazy = false,
		cmd = { "Oil" },
		---@module 'oil'
		---@type oil.SetupOpts
		opts = require "configs.oil-nvim",
		setup = function(_, opts)
			require("oil").setup(opts)
		end,
		-- Optional dependencies
		dependencies = { { "echasnovski/mini.icons", opts = {} } },
		-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
	},
	{
		"tpope/vim-fugitive",
		lazy = false,
		cmd = { "G" },
	},
	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
	},
	{
		"folke/trouble.nvim",
		lazy = false,
		opts = require "configs.trouble",
		cmd = "Trouble",
		keys = {
			{
				"<leader>td",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>tl",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>tq",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},
	{
		"toppair/peek.nvim",
		build = "deno task --quiet build:fast",
		opts = { theme = "dark", app = "browser" },
	},
	{
		"mfussenegger/nvim-dap",
	},
	{
		"dreamsofcode-io/nvim-dap-go",
		ft = "go",
		dependencies = "mfussenegger/nvim-dap",
		config = function(_, opts)
			require("dap-go").setup(opts)
		end,
	},
	{
		"olexsmir/gopher.nvim",
		ft = "go",
		-- branch = "develop", -- if you want develop branch
		-- keep in mind, it might break everything
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"mfussenegger/nvim-dap", -- (optional) only if you use `gopher.dap`
		},
		cmd = { "GoInstallDeps" },
		-- (optional) will update plugin's deps on every update
		build = function()
			-- vim.cmd.GoInstallDeps()
			vim.cmd [[! GoInstallDeps]]
		end,
		setup = function()
			require("gopher.nvim").install_deps()
		end,
		opts = require "configs.gopher",
	},
}
