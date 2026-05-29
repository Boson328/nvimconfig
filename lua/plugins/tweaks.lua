return {
	{
		"nvim-mini/mini.move",
		version = false,
		-- No need to copy this inside `setup()`. Will be used automatically.
		-- Module mappings. Use `''` (empty string) to disable one.
		opts = {
			mappings = {
				left = "<A-h>",
				right = "<A-l>",
				down = "<A-j>",
				up = "<A-k>",

				-- Move current line in Normal mode
				line_left = "<A-h>",
				line_right = "<A-l>",
				line_down = "<A-j>",
				line_up = "<A-k>",
			},

			-- Options which control moving behavior
			options = {
				-- Automatically reindent selection during linewise vertical move
				reindent_linewise = true,
			},
		},
	},
	{
		"uga-rosa/ccc.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			highlighter = {
				-- ハイライトの自動有効化
				auto_enable = true,
				-- ハイライトが有効になるファイルタイプの制限
				filetypes = { "css", "html", "vim", "toml" },
			},
		},
	},
	{
		"echasnovski/mini.pairs",
		event = "InsertEnter",
		opts = {},
		keys = {
			{
				"<CR>",
				function()
					return require("mini.pairs").cr()
				end,
				mode = "i",
				expr = true,
			},
		},
	},
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		-- セッション管理
		"folke/persistence.nvim",
		event = "BufReadPre",
		opts = {},
		keys = {
			{
				"<leader>qs",
				function()
					require("persistence").load()
				end,
				desc = "Restore Session",
			},
			{
				"<leader>ql",
				function()
					require("persistence").load({ last = true })
				end,
				desc = "Restore Last Session",
			},
			{
				"<leader>qd",
				function()
					require("persistence").stop()
				end,
				desc = "Don't Save Current Session",
			},
		},
	},
	{
		-- TODOリストが分かりやすくなる
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
	},
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup()
		end,
	},
}
